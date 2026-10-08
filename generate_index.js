const lunr = require("lunr");

function generateIndex(data) {
  const lunrIndex = lunr(function () {
    this.ref("permalink");
    ["title", "contents", "tags", "categories"].forEach((field) => this.field(field));

    data.forEach((article) => {
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
  return JSON.stringify({ index, lunrIndex });
}

module.exports = generateIndex;

if (require.main === module) {
  process.stdin.setEncoding("utf8");
  const buffer = [];
  process.stdin.on("data", (chunk) => buffer.push(chunk));
  process.stdin.on("end", () => {
    process.stdout.write(generateIndex(JSON.parse(buffer.join(""))));
  });
}
