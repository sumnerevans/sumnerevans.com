import mediumZoom from "medium-zoom";

document
  .querySelectorAll<HTMLAnchorElement>('a[target="_blank"]')
  .forEach((link) => {
    const picture = link.querySelector<HTMLElement>("picture:not(.no-zoom)");
    if (!picture) return;
    const img = picture.querySelector<HTMLImageElement>("img");
    if (!img) return;

    img.setAttribute("data-zoom-src", link.href);
    link.addEventListener("click", (e) => e.preventDefault());
  });

const zoomMargin = () => (window.innerWidth <= 600 ? 0 : 24);

window.zoom = mediumZoom("[data-zoom-src]", {
  background: "rgba(0, 0, 0, 0.85)",
  margin: zoomMargin(),
});

window.addEventListener("resize", () => {
  window.zoom.update({ margin: zoomMargin() });
});
