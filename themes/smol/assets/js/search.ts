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
  const version = "v2";
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

  const searchCache = await caches.open(`search-cache-${version}`);
  const loadAndCache = async (url: string): Promise<Response> => {
    const resp = await searchCache.match(url);
    if (resp) {
      return resp;
    }

    // Delete the old keys from the cache
    const oldCacheKeys = await searchCache.keys(url, { ignoreSearch: true });
    console.log(
      "Deleting old cache keys",
      oldCacheKeys.map((r) => r.url)
    );
    await Promise.all(oldCacheKeys.map((r) => searchCache.delete(r)));

    // Add the new index in
    await searchCache.put(url, await fetch(url, { method: "GET" }));
    return (await searchCache.match(url))!;
  };

  const loadSearchIndex = async () => {
    if (lunrSearchIndex) {
      searchInput.focus();
      return;
    }
    console.time("fetch indexes");
    const [indexResp, searchIndexResp] = await Promise.all([
      await loadAndCache(`/index.json?v=${version}&cb=${hash}`),
      await loadAndCache(`/search-index.json?v=${version}cb=${hash}`),
    ]);
    console.timeEnd("fetch indexes");

    console.time("initialize the search index");
    for (const result of await indexResp.json()) {
      rawIndex[result.permalink] = result;
    }
    lunrSearchIndex = lunr.Index.load(await searchIndexResp.json());
    console.timeEnd("initialize the search index");

    searchInput.removeAttribute("disabled");
    searchInput.placeholder = "Search...";
    searchInput.focus();
  };

  document.getElementById("toggle_search")?.addEventListener("click", () => {
    const searchDivClasses =
      document.getElementById("search-container")!.classList;
    if (searchDivClasses.contains("hidden")) {
      searchDivClasses.remove("hidden");
      loadSearchIndex().catch((e) => {
        searchResultsDiv.innerHTML = `<p class="no-results">Failed to load search index: ${e}</p>`;
      });
    } else {
      searchDivClasses.add("hidden");
    }
  });

  const main = document.querySelector("main");
  if (main) {
    const marker = new Mark(main);
    new URL(document.location.toString()).searchParams
      .getAll("hl")
      .forEach((hl) => marker.mark(decodeURIComponent(hl)));
  }
});
