const options = document.getElementById("dark-theme-script")?.dataset;
const defaultTheme = options?.defaultTheme ?? "light";
const enableAutoDetectTheme =
  options?.enableAutoDetectTheme?.toLowerCase() === "true";

const darkThemeMatch = window.matchMedia(
  "(prefers-color-scheme: dark)" +
  (defaultTheme === "light" ? "" : ",(prefers-color-scheme: no-preference)")
);

const detectThemeAndSwitchStyle = () => {
  let theme = localStorage.getItem("themeOverride");
  if (theme !== "light" && theme !== "dark") {
    if (theme === "browser" || enableAutoDetectTheme) {
      theme = darkThemeMatch.matches ? "dark" : "light";
    } else {
      theme = defaultTheme;
    }
  }

  const body = document.body;
  if (theme === "dark") {
    body.classList.add("dark-theme");
    body.classList.remove("light-theme");
  } else {
    body.classList.add("light-theme");
    body.classList.remove("dark-theme");
  }

  const notByAILogo = document.getElementById("not-by-ai-logo");
  if (notByAILogo) {
    (notByAILogo as HTMLImageElement).src =
      "https://notbyai.fyi/img/written-by-human-not-by-ai-" +
      (theme === "dark" ? "black" : "white") +
      ".svg";
  }
};

detectThemeAndSwitchStyle();

const switchTheme = (themeOverride: string) => {
  localStorage.setItem("themeOverride", themeOverride);
  detectThemeAndSwitchStyle();
};

// If theme auto-detection is enabled, then add a listenr on the matchMedia.
if (enableAutoDetectTheme) {
  darkThemeMatch.addEventListener("change", detectThemeAndSwitchStyle);
}

const themeSwitcher = document.getElementById("theme-switcher");
if (themeSwitcher) {
  const mkLink = (theme: string) => {
    const link = document.createElement("span");
    link.classList.add("link");
    link.appendChild(document.createTextNode(theme));
    link.addEventListener("click", () => switchTheme(theme));
    return link;
  };
  themeSwitcher.appendChild(document.createTextNode("Switch to the "));
  themeSwitcher.appendChild(mkLink("dark"));
  themeSwitcher.appendChild(document.createTextNode(" | "));
  themeSwitcher.appendChild(mkLink("light"));
  themeSwitcher.appendChild(document.createTextNode(" | "));
  themeSwitcher.appendChild(mkLink("browser"));
  themeSwitcher.appendChild(document.createTextNode(" theme."));
}
