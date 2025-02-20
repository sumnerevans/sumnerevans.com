import lunr from "lunr";
import Mark from "mark.js";

interface SearchResult {
  ref: string;
  matchData: {
    metadata: Record<string, any>;
  };
}

interface RawRecord {
  categories: string[];
  contents: string;
  permalink: string;
  tags: string[];
  title: string;
}

document.addEventListener("DOMContentLoaded", async () => {
  const version = "v1";
  let rawIndex: Record<string, RawRecord> = {};
  let lunrSearchIndex: lunr.Index | undefined;
  const searchInput = document.getElementById(
    "search-query"
  )! as HTMLInputElement;
  const searchResultsDiv = document.getElementById("search-results")!;

  const summarize = (
    searchResult: SearchResult,
    i: number
  ): [HTMLDivElement, string[]] => {
    const article = rawIndex[searchResult.ref];
    const hls = Object.keys(searchResult.matchData.metadata);
    const hlQuery = hls.map((h) => `hl=${encodeURIComponent(h)}`).join("&");
    const categoriesList = article.categories?.map(
      (c) => `<a href="/categories/${c.toLowerCase()}">${c}</a>`
    );
    const tagsList = article.tags?.map(
      (t) => `<a href="/tags/${t.toLowerCase()}">${t}</a>`
    );
    const searchResultDiv = document.createElement("div");
    searchResultDiv.classList.add("search-result");
    searchResultDiv.id = `search-result-${i}`;
    searchResultDiv.innerHTML = `
      <h4><b><a href="${searchResult.ref}?${hlQuery}">${article.title}</a></b></h4>
      ${categoriesList?.length ? `<p class="categories"><b>Posted in ${categoriesList.join(", ")}</b></p>` : ""}
      ${tagsList?.length ? `<p class="tags">Tags: ${tagsList.join(", ")}</p>` : ""}
      <div class="content-summary">
        ${article.contents?.replace("\n", "<br>")}
      </div>
    `;
    return [searchResultDiv, hls];
  };

  const runSearch = (searchString: string) => {
    console.log("Searching for", searchString);
    let searchResults: lunr.Index.Result[] = [];
    if (searchString && searchString.length > 2) {
      try {
        searchResults = lunrSearchIndex!.search(searchString);
      } catch (err) {
        searchResultsDiv.innerHTML = `Error: ${err.message}`;
        return;
      }
    }

    if (searchResults.length === 0) {
      searchResultsDiv.innerHTML =
        '<p class="no-results">Enter a search term above</p>';
      return;
    }

    const summaries = searchResults.map(summarize);
    searchResultsDiv.innerHTML = ""; // Clear the previous search results
    summaries.forEach(([r, highlights], i) => {
      if (i > 0) {
        searchResultsDiv.appendChild(document.createElement("hr"));
      }
      searchResultsDiv.appendChild(r);
      new Mark(r).mark(highlights);
    });
  };

  let searchDebounce: number | undefined;
  searchInput.addEventListener("input", (e) => {
    window.clearTimeout(searchDebounce);
    searchDebounce = window.setTimeout(
      () => runSearch((e.target as HTMLInputElement).value),
      200
    );
  });

  const hash = await (await fetch("/index.sha256", { method: "GET" })).text();
  console.log("Got content hash", hash);
  const indexUrl = `/index.json?v=${version}&cb=${hash}`;
  const searchIndexUrl = `/search-index.json?v=${version}cb=${hash}`;

  const searchCache = await caches.open(`search-cache-${version}`);

  let loading = false;
  const loadSearchIndex = async () => {
    if (loading || lunrSearchIndex) {
      searchInput.focus();
      return;
    }
    loading = true;
    console.log("Fetching raw and search indexes");
    const indexReq =
      (await searchCache.match(indexUrl)) ??
      (await fetch(indexUrl, { method: "GET" }));
    const searchIndexReq =
      (await searchCache.match(searchIndexUrl)) ??
      (await fetch(searchIndexUrl, { method: "GET" }));
    console.log("Fetched raw and search indexes");

    console.log("Initializing the search index");
    for (const result of await indexReq.json()) {
      rawIndex[result.permalink] = result;
    }
    lunrSearchIndex = lunr.Index.load(await searchIndexReq.json());
    console.log("Initialized the search index");

    console.log("Enabling search box");
    searchInput.removeAttribute("disabled");
    searchInput.placeholder = "Search...";
    searchInput.focus();
  };

  document.getElementById("toggle_search")?.addEventListener("click", () => {
    const searchDivClasses =
      document.getElementById("search-container")!.classList;
    if (searchDivClasses.contains("hidden")) {
      searchDivClasses.remove("hidden");
      loadSearchIndex();
    } else {
      searchDivClasses.add("hidden");
    }
  });

  if (!(await searchCache.match(indexUrl))) {
    console.log(`Prefetching ${indexUrl}`);
    searchCache.put(indexUrl, await fetch(indexUrl, { method: "GET" }));
  }
  if (!(await searchCache.match(searchIndexUrl))) {
    console.log(`Prefetching ${searchIndexUrl}`);
    searchCache.put(
      searchIndexUrl,
      await fetch(searchIndexUrl, { method: "GET" })
    );
  }

  const main = document.querySelector("main");
  if (main) {
    const marker = new Mark(main);
    new URL(document.location.toString()).searchParams
      .getAll("hl")
      .forEach((hl) => marker.mark(decodeURIComponent(hl)));
  }
});
