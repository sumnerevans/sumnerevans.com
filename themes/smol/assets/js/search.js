(async () => {
  const searchInput = document.getElementById("search-query");
  let rawIndex = {};
  let lunrSearchIndex;

  const makeNode = (tagName, content) => `<${tagName}>${content}</${tagName}>`;

  const highlightSearchTerm = (string, matchKey, metadata) => {
    let highlightRanges = [[0, 0]];
    Object.keys(metadata).forEach(key => {
      const position = (metadata[key][matchKey] || {}).position;
      highlightRanges = highlightRanges.concat(position || []);
    });

    const padChars = 70;

    let nextStart = string.length;
    // Sort backwards so that we don't mutate the part of the string that we
    // need to access. Also, limit to the first 10 occurrences of the term
    // (which are the last 10 ranges in the reverse-sorted list).
    const filteredHighlightRanges = highlightRanges
      .sort((x, y) => x[0] < y[0])
      .slice(Math.max(0, highlightRanges.length - 10));
    for (const [start, end] of filteredHighlightRanges) {
      const diff = nextStart - (start + end);
      let toEnd = string.substring(start + end);
      if (diff > padChars * 2) {
        // More than padChars*2 characters between the end of this range and
        // the next one, add dots.
        toEnd = `${toEnd.substring(0, padChars)}... `;
        if (nextStart < string.length) {
          toEnd += string.substring(nextStart - padChars);
        }
      }
      const highlighted = string.substring(start, start + end);
      string = string.substring(0, start) +
        (start > 0 || end > 0 ? makeNode('mark', highlighted) : highlighted) +
        toEnd;
      nextStart = start;
    }

    return string;
  };

  const highlightSearchTermInList = (listItems, matchKey, metadata) =>
    highlightSearchTerm(listItems.join(' | '), matchKey, metadata).split(' | ').join(', ');

  const summarize = searchResult => {
    const article = rawIndex[searchResult.ref];
    const metadata = searchResult.matchData.metadata;

    let summaryLines = [makeNode('h1', highlightSearchTerm(article.title, 'title', metadata))];
    if (article.tags && article.tags.length > 0) {
      summaryLines.push(makeNode('p', `Tags: ${highlightSearchTermInList(article.tags, 'tags', metadata)}`));
    }
    if (article.categories && article.categories.length > 0) {
      summaryLines.push(makeNode('p', `Categories: ${highlightSearchTermInList(article.categories, 'categories', metadata)}`));
    }
    summaryLines = summaryLines.concat(
      highlightSearchTerm(article.contents, 'contents', metadata)
        .split('\n')
        .map(p => makeNode('p', p)));

    return `<a href="${article.permalink}">${summaryLines.join('')}</a>`;
  };

  searchInput.addEventListener('keyup', e => {
    const searchResultsDiv = document.getElementById("search-results");
    const searchString = e.target.value;
    let searchResults = [];
    if (searchString && searchString.length > 2) {
      try {
        searchResults = lunrSearchIndex.search(searchString);
      } catch (err) {
        searchResultsDiv.innerHTML = `Error: ${err.message}`;
        return
      }
    }

    if (searchResults.length === 0) {
      searchResultsDiv.innerHTML = '<p class="no-results">No results</p>';
      return;
    }

    searchResultsDiv.innerHTML = `<ul>${searchResults.map(searchResult =>
      `<li>${summarize(searchResult)}</li>`
    ).join('')}</ul>`;
  });

  const hash = await (await fetch("/index.sha256", { method: "GET" })).text();
  console.log("Got content hash", hash)
  const indexUrl = `/index.json?cb=${hash}`;
  const searchIndexUrl = `/search-index.json?cb=${hash}`;

  const searchCache = await caches.open("search-cache");

  let loading = false;
  const loadSearchIndex = async () => {
    if (loading || lunrSearchIndex) return;
    loading = true;
    console.log("Fetching raw and search indexes");
    const indexReq = await searchCache.match(indexUrl) ?? await fetch(indexUrl, { method: "GET" });
    const searchIndexReq = await searchCache.match(searchIndexUrl) ?? await fetch(searchIndexUrl, { method: "GET" });
    console.log("Fetched raw and search indexes");

    console.log("Initializing the search index");
    for (const result of (await indexReq.json())) {
      rawIndex[result.permalink] = result;
    }
    lunrSearchIndex = lunr.Index.load(await searchIndexReq.json());
    console.log("Initialized the search index");

    console.log("Enabling search box");
    searchInput.removeAttribute('disabled');
    searchInput.placeholder = "Search...";
  };

  document.getElementById("toggle_search").addEventListener("click", () => {
    const searchDivClasses = document.getElementById("search-container").classList;
    if (searchDivClasses.contains("hidden")) {
      searchDivClasses.remove("hidden");
      loadSearchIndex();
    } else {
      searchDivClasses.add("hidden");
    }
  });

  if (!await searchCache.match(indexUrl)) {
    console.log(`Prefetching ${indexUrl}`);
    searchCache.put(indexUrl, await fetch(indexUrl, { method: "GET" }));
  }
  if (!await searchCache.match(searchIndexUrl)) {
    console.log(`Prefetching ${searchIndexUrl}`);
    searchCache.put(searchIndexUrl, await fetch(searchIndexUrl, { method: "GET" }));
  }
})()
