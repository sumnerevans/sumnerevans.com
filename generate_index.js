const lunr = require('lunr');

process.stdin.resume();
process.stdin.setEncoding('utf8');

const buffer = [];
process.stdin.on('data', (d) => buffer.push(d));

process.stdin.on('end', () => {
  const data = JSON.parse(buffer.join(''));
  var lunrIndex = lunr(function() {
    this.ref("permalink");
    ["title", "contents", "tags", "categories"].forEach(f => this.field(f));

    data.forEach(article => {
      this.add({
        permalink: article.permalink,
        title: article.title,
        contents: article.contents,
        tags: (article.tags ?? []).join(" | "),
        categories: (article.categories ?? []).join(" | "),
      });
    });
  });

  const index = {};
  for (const article of data) {
    index[article.permalink] = article;
  }
  process.stdout.write(JSON.stringify({ index, lunrIndex }));
})
