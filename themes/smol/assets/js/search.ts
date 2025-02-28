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
    const [categoriesList, tagsList] = ["categories", "tags"].map((t) =>
      article[t]?.map(
        (c) => `<a href="/${t}/${c.toLowerCase().replace(" ", "-")}">${c}</a>`
      )
    );
    const searchResultDiv = document.createElement("div");
    searchResultDiv.classList.add("search-result");
    searchResultDiv.id = `search-result-${i}`;
    searchResultDiv.innerHTML =
      `<h4><b><a href="${searchResult.ref}?${hlQuery}">${article.title}</a></b></h4>` +
      `${categoriesList?.length ? `<p class="categories"><b>Posted in ${categoriesList.join(", ")}</b></p>` : ""}` +
      `${tagsList?.length ? `<p class="tags">Tags: ${tagsList.join(", ")}</p>` : ""}` +
      `<div class="content-summary">` +
      `${article.contents?.replace("\n", "<br>")}` +
      `</div>`;
    return [searchResultDiv, hls];
  };

  const runSearch = (searchString: string) => {
    console.log("Searching for", searchString);
    let searchResults: lunr.Index.Result[] = [];
    if (searchString && searchString.length > 2) {
      try {
        searchResults = lunrSearchIndex!.search(searchString).slice(0, 10);
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

  const loadSearchIndex = async () => {
    const version = "v3";
    if (lunrSearchIndex) {
      searchInput.focus();
      return;
    }
    console.time("fetch index");
    const searchIndexUrl = `/search-index.json?v=${version}&ch=${hash}`;
    const searchIndex = await (
      await fetch(searchIndexUrl, { method: "GET" })
    ).json();
    console.timeEnd("fetch index");

    console.time("initialize the search index");
    rawIndex = searchIndex.index;
    lunrSearchIndex = lunr.Index.load(searchIndex.lunrIndex);
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
