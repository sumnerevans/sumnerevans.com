const fs = require("node:fs/promises");
const path = require("node:path");
const generateIndex = require("./generate_index");

const server = process.env.HUGO_SERVER_URL ?? "http://localhost:1313";
const output = path.join(__dirname, "static", "search-index.json");
let lastHash;
let stopped = false;

process.on("SIGINT", () => { stopped = true; });
process.on("SIGTERM", () => { stopped = true; });

async function update() {
  const hashResponse = await fetch(`${server}/index.sha256`);
  if (!hashResponse.ok) throw new Error(`Checksum request failed: ${hashResponse.status}`);
  const hash = (await hashResponse.text()).trim();
  if (hash === lastHash) return;

  const indexResponse = await fetch(`${server}/index.json`);
  if (!indexResponse.ok) throw new Error(`Index request failed: ${indexResponse.status}`);
  const index = generateIndex(await indexResponse.json());
  const temporary = `${output}.${process.pid}.tmp`;
  try {
    await fs.writeFile(temporary, index);
    await fs.rename(temporary, output);
  } catch (error) {
    await fs.rm(temporary, { force: true });
    throw error;
  }
  lastHash = hash;
  console.log(`Updated ${output}`);
}

async function main() {
  while (!stopped) {
    try {
      await update();
    } catch (error) {
      console.error(`Search index update failed: ${error.message}`);
    }
    if (!stopped) await new Promise((resolve) => setTimeout(resolve, 3000));
  }
}

main();
