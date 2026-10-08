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

document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("toggle-search")?.classList.remove("hidden");

  let rawIndex: Record<string, RawRecord> = {};
  let lunrSearchIndex: lunr.Index | undefined;
  const searchInput = document.getElementById(
    "search-query"
  )! as HTMLInputElement;
  const searchForm = document.getElementById("search-form")! as HTMLFormElement;
  const searchStatus = document.getElementById("search-status")!;
  const searchResultsDiv = document.getElementById("search-result-items")!;

  const summarize = (
    searchResult: SearchResult,
    i: number
  ): [HTMLDivElement, string[]] => {
    const article = rawIndex[searchResult.ref];
    const hls = Object.keys(searchResult.matchData.metadata);
    const hlQuery = hls.map((h) => `hl=${encodeURIComponent(h)}`).join("&");
    const [categoriesList, tagsList] = ["categories", "tags"].map((t) =>
      article[t]?.map(
        (c) => `<a href="/${t}/${c.toLowerCase().replaceAll(" ", "-")}">${c}</a>`
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
      `${article.contents?.replaceAll("\n", "<br>")}` +
      `</div>`;
    return [searchResultDiv, hls];
  };

  const runSearch = (searchString: string) => {
    console.log("Searching for", searchString);
    const query = searchString.trim();
    searchResultsDiv.replaceChildren();

    if (query.length < 3) {
      searchStatus.textContent = query
        ? "Type at least 3 characters to search."
        : "Enter a search term above";
      return;
    }

    let searchResults: lunr.Index.Result[] = [];
    try {
      searchResults = lunrSearchIndex!.search(query);
    } catch (err) {
      searchStatus.textContent = "Search query could not be processed.";
      return;
    }

    if (searchResults.length === 0) {
      searchStatus.textContent = "No results found.";
      return;
    }

    const displayedResults = searchResults.slice(0, 10);
    searchStatus.textContent = searchResults.length > displayedResults.length
      ? `Showing ${displayedResults.length} of ${searchResults.length} results.`
      : `${searchResults.length} result${searchResults.length === 1 ? "" : "s"} found.`;
    const summaries = displayedResults.map(summarize);
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

  searchForm.addEventListener("submit", (e) => {
    e.preventDefault();
    window.clearTimeout(searchDebounce);
    runSearch(searchInput.value);
  });

  searchInput.addEventListener("keydown", (e) => {
    if (e.key === "Enter") {
      e.preventDefault();
      searchForm.requestSubmit();
    }
  });

  let searchIndexPromise: Promise<void> | undefined;
  const loadSearchIndex = (): Promise<void> => {
    if (lunrSearchIndex) {
      searchInput.focus();
      return Promise.resolve();
    }
    if (!searchIndexPromise) {
      searchStatus.textContent = "Loading search...";
      searchIndexPromise = (async () => {
        const hashResponse = await fetch("/index.sha256");
        const hash = hashResponse.ok ? await hashResponse.text() : "";
        console.log("Got content hash", hash);

        let searchIndex;
        console.time("fetch index");
        try {
          const searchIndexResponse = await fetch(
            `/search-index.json?v=v3&ch=${encodeURIComponent(hash.trim())}`
          );
          if (!searchIndexResponse.ok) throw new Error("Search index is unavailable");
          searchIndex = await searchIndexResponse.json();
        } finally {
          console.timeEnd("fetch index");
        }

        console.time("initialize the search index");
        rawIndex = searchIndex.index;
        lunrSearchIndex = lunr.Index.load(searchIndex.lunrIndex);
        console.timeEnd("initialize the search index");

        searchInput.disabled = false;
        searchInput.placeholder = "Search...";
        searchStatus.textContent = "Enter a search term above";
        searchInput.focus();
      })().catch((error) => {
        searchIndexPromise = undefined;
        throw error;
      });
    }
    return searchIndexPromise;
  };

  const searchToggle = document.getElementById("toggle-search");
  searchToggle?.addEventListener("click", () => {
    const searchDivClasses =
      document.getElementById("search-container")!.classList;
    if (searchDivClasses.contains("hidden")) {
      searchToggle.classList.add("active");
      searchToggle.setAttribute("aria-expanded", "true");
      searchDivClasses.remove("hidden");
      loadSearchIndex().catch((e) => {
        console.error("Failed to load search index", e);
        searchStatus.textContent = "Search is unavailable right now.";
      });
    } else {
      searchToggle.classList.remove("active");
      searchToggle.setAttribute("aria-expanded", "false");
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
