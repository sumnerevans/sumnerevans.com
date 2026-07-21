const options = document.querySelector("#dark-theme-script")?.dataset;
const themeSwitcher = document.querySelector("#theme-switcher");

const darkThemeMatch = window.matchMedia(
  "(prefers-color-scheme: dark),(prefers-color-scheme: no-preference)"
);

const resolveTheme = () => {
  let theme = localStorage.getItem("themeOverride");
  if (theme !== "light" && theme !== "dark") {
      return darkThemeMatch.matches ? "dark" : "light";
  }
  return theme;
}

const detectThemeAndSwitchStyle = () => {
  let theme = resolveTheme();

  const body = document.body;
  if (theme === "dark") {
    body.classList.add("dark-theme");
    body.classList.remove("light-theme");
  } else {
    body.classList.add("light-theme");
    body.classList.remove("dark-theme");
  }

  const notByAILogo = document.querySelector("#not-by-ai-logo");
  if (notByAILogo) {
    (notByAILogo as HTMLImageElement).src =
      "https://notbyai.fyi/img/written-by-human-not-by-ai-" +
      (theme === "dark" ? "black" : "white") +
      ".svg";
  }

  window.zoom.update({
    background:
      theme === "dark" ? "rgba(0, 0, 0, 0.85)" : "rgba(255, 255, 255, 0.9)",
  });

  const giscuss = document.querySelector("iframe.giscus-frame") as HTMLIFrameElement | null;
  if (giscuss) {
    giscuss.contentWindow?.postMessage({
      giscus: {
        setConfig: { theme },
      },
    }, "https://giscus.app");
  }

  document.querySelector("#theme-switcher .link.dark")?.classList.toggle("disabled", localStorage.getItem("themeOverride") === "dark");
  document.querySelector("#theme-switcher .link.light")?.classList.toggle("disabled", localStorage.getItem("themeOverride") === "light");
  document.querySelector("#theme-switcher .link.browser")?.classList.toggle("disabled", ["browser", null].includes(localStorage.getItem("themeOverride")));
};

detectThemeAndSwitchStyle();

window.theme = {
  switch: (themeOverride: string) => {
    localStorage.setItem("themeOverride", themeOverride);
    detectThemeAndSwitchStyle();
  },
};

darkThemeMatch.addEventListener("change", detectThemeAndSwitchStyle);

if (themeSwitcher) {
  themeSwitcher.classList.remove("hidden");
  for (const theme of ["dark", "light", "browser"]) {
    themeSwitcher
      .querySelector(`.${theme}`)
      ?.addEventListener("click", (e) =>
        !(e.currentTarget as HTMLElement).classList.contains("disabled")
        && window.theme.switch(theme)
      );
  }
}

// Dynamically load Giscus script with the correct theme
const giscusAttributes = {
  "src": "https://giscus.app/client.js",
  "data-repo": "sumnerevans/sumnerevans.com",
  "data-repo-id": "R_kgDOGejfWA",
  "data-category": "Announcements",
  "data-category-id": "DIC_kwDOGejfWM4DAkOg",
  "data-mapping": "pathname",
  "data-strict": "1",
  "data-reactions-enabled": "1",
  "data-emit-metadata": "0",
  "data-input-position": "top",
  "data-theme": resolveTheme(),
  "data-lang": "en",
  "crossorigin": "anonymous",
  "async": "",
};

const giscusScript = document.createElement("script");
Object.entries(giscusAttributes).forEach(([key, value]) => giscusScript.setAttribute(key, value));
document.querySelector("aside.comments")?.appendChild(giscusScript);