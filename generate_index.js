var lunr = require('lunr'),
  stdin = process.stdin,
  stdout = process.stdout,
  buffer = []

stdin.resume()
stdin.setEncoding('utf8')

stdin.on('data', function(data) {
  buffer.push(data)
})

stdin.on('end', function() {
  var idx = lunr(function() {
    this.ref("permalink");
    ["title", "contents", "tags", "categories"].forEach(f => this.field(f));
    // This is so that we can highlight stuff.
    this.metadataWhitelist = ["position"];

    JSON.parse(buffer.join('')).forEach(article => {
      this.add({
        permalink: article.permalink,
        title: article.title,
        contents: article.contents,
        tags: (article.tags ?? []).join(" | "),
        categories: (article.categories ?? []).join(" | "),
      });
    });
  });

  stdout.write(JSON.stringify(idx))
})
