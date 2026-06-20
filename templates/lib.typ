// twyla placeholder templates — identity passthroughs until the
// theme system lands. Replace with real layout as you port.
#import "@preview/use-tabler-icons:0.15.0": *

// Brand icons
#import "@preview/sicons:16.0.0": *
#let si(class) = html.span(raw-html(sicon-raw(slug: class).text), class: "icon")

// A nerd-font glyph: `<i class="nf nf-...">`.
#import "@preview/nerd-icons:0.2.0": nf-icon
#let nf(class) = html.span(html.frame(nf-icon(class)), class: "icon")

#let base-url = sys.inputs.at("base_url", default: "")
#let site-root = base-url + "/"

// SVG icons (inline, matching the hi-svg-inline class from the smol theme)
#let svg-about = raw-html(
  "<svg aria-hidden=\"true\" class=\"hi-svg-inline\" fill=\"none\" height=\"1em\" stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" viewBox=\"0 0 24 24\" width=\"1em\"><path d=\"M8 7a4 4 0 108 0A4 4 0 008 7\"/><path d=\"M6 21v-2a4 4 0 014-4h4a4 4 0 014 4v2\"/></svg>",
)
#let svg-portfolio = raw-html(
  "<svg aria-hidden=\"true\" class=\"hi-svg-inline\" fill=\"none\" height=\"1em\" stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" viewBox=\"0 0 24 24\" width=\"1em\"><path d=\"M3 9a2 2 0 012-2h14a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9\"/><path d=\"M8 7V5a2 2 0 012-2h4a2 2 0 012 2v2\"/><path d=\"M12 12v.01\"/><path d=\"M3 13a20 20 0 0018 0\"/></svg>",
)
#let svg-posts = raw-html(
  "<svg aria-hidden=\"true\" class=\"hi-svg-inline\" fill=\"none\" height=\"1em\" stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" viewBox=\"0 0 24 24\" width=\"1em\"><path d=\"M15 21H6a3 3 0 01-3-3v-1h10v2a2 2 0 004 0V5a2 2 0 112 2h-2m2-4H8A3 3 0 005 6v11\"/><path d=\"M9 7h4\"/><path d=\"M9 11h4\"/></svg>",
)
#let svg-categories = raw-html(
  "<svg aria-hidden=\"true\" class=\"hi-svg-inline\" fill=\"none\" height=\"1em\" stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" viewBox=\"0 0 24 24\" width=\"1em\"><path d=\"M5 9h14\"/><path d=\"M5 15h14\"/><path d=\"M11 4 7 20\"/><path d=\"M17 4l-4 16\"/></svg>",
)
#let svg-tags = raw-html(
  "<svg aria-hidden=\"true\" class=\"hi-svg-inline\" fill=\"none\" height=\"1em\" stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" viewBox=\"0 0 24 24\" width=\"1em\"><path d=\"M3 8v4.172a2 2 0 00.586 1.414l5.71 5.71a2.41 2.41.0 003.408.0l3.592-3.592a2.41 2.41.0 000-3.408l-5.71-5.71A2 2 0 009.172 6H5A2 2 0 003 8\"/><path d=\"M18 19l1.592-1.592a4.82 4.82.0 000-6.816L15 6\"/><path d=\"M7 10h-.01\"/></svg>",
)
#let svg-search = raw-html(
  "<svg aria-hidden=\"true\" class=\"hi-svg-inline\" fill=\"none\" height=\"1em\" stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" viewBox=\"0 0 24 24\" width=\"1em\"><path d=\"M3 10a7 7 0 1014 0A7 7 0 103 10\"/><path d=\"M21 21l-6-6\"/></svg>",
)

#let nav-html(bu) = html.elem("nav", [
  #html.div(class: "nav-links", [
    #html.a(href: bu + "/about", title: "About")[#svg-about
      #html.span[About]
    ]
    #html.a(href: bu + "/portfolio", title: "Portfolio")[#svg-portfolio
      #html.span[Portfolio]]
    #html.div(class: "posts", [
      #html.a(href: bu + "/posts", title: "Posts")[#svg-posts
        #html.span[Posts]]
      #html.div(class: "categories-tags-collapsed", [
        (#html.a(href: bu + "/categories", title: "Categories")[
          #svg-categories
        ]#html.a(href: bu + "/tags", title: "Tags")[#svg-tags
        ])
      ])
    ])
    #html.a(href: bu + "/categories", title: "Categories", class: "categories-link")[#svg-categories
      #html.span[Categories]
    ]
    #html.a(href: bu + "/tags", title: "Tags", class: "tags-link")[#svg-tags
      #html.span[Tags]]
  ])
  #html.div(id: "toggle-search", class: "hidden", [#svg-search])
  #html.div(id: "search-container", class: "hidden", [
    #html.elem("form", attrs: (class: "search", method: "get"), [
      #html.elem("input", attrs: (id: "search-query", type: "search", placeholder: "Loading...", disabled: ""))
    ])
    #html.div(id: "search-results", [
      #html.p(class: "no-results", [Enter a search term above])
    ])
  ])
])

#let html_wrapper(body) = html.elem("html", attrs: (lang: "en-us"), [
  #html.head[
    #html.meta(charset: "utf-8")
    #html.meta(content: "True", name: "HandheldFriendly")
    #html.meta(content: "width=device-width,initial-scale=1", name: "viewport")
    #html.meta(http-equiv: "x-ua-compatible", content: "IE=edge")
    #context html.title[#plain-text(document.title) - Sumner Evans]
    #context html.meta(name: "description", content: plain-text(document.description))
    #html.meta(name: "author", content: "Sumner Evans")
    #context html.elem("meta", attrs: (property: "og:image", content: asset.file("/assets/profile.jpg").url()))
    #context html.elem("meta", attrs: (property: "og:url", content: site-root)) // TODO twyla-convert: this should be the canonical URL of the page, not the site root
    #html.elem("meta", attrs: (property: "og:site_name", content: "Sumner Evans"))
    #context html.elem("meta", attrs: (property: "og:title", content: plain-text(document.title)))
    #context html.elem("meta", attrs: (property: "og:description", content: plain-text(document.description)))
    #html.elem("meta", attrs: (property: "og:locale", content: "en_us"))
    #html.elem("meta", attrs: (property: "og:type", content: "article"))
    #context if document.date != none [
      #html.elem("meta", attrs: (
        property: "article:published_time",
        content: document.date.display("[year]-[month]-[day]"),
      ))
    ]
    // TODO twyla-convert: add support for article:modified_time once we have a way to get the last modified time of a document
    #html.meta(name: "twitter:card", content: "summary")
    #context html.meta(name: "twitter:title", content: plain-text(document.title))
    #context html.meta(name: "twitter:description", content: plain-text(document.description))
    #context html.style(asset.sass("/themes/smol/assets/scss/main.scss").read())
    #html.script()
  ]
  #html.body[
    #html.header[
      #html.div(class: "name-and-subtitle", [
        #html.div(class: "site-title", [
          #html.a(href: site-root)[Sumner Evans]
        ])
        #html.div(class: "site-subtitle", [
          Tech Lead at Can/Am Technologies
        ])
      ])
      #html.a(href: site-root, class: "site-image", [
        #html.elem("picture", [
          // TODO image processing
          // #html.elem("source", attrs: (type: "image/webp", media: "(max-width: 600px)", srcset: ""))
          // #html.elem("source", attrs: (type: "image/webp", srcset: ""))
          #context html.elem("img", attrs: (
            src: asset.file("/assets/profile.jpg").url(),
            width: "150",
            height: "150",
            alt: "Sumner Evans",
          ))
        ])
      ])
      #html.div(class: "links", [
        #html.elem("a", attrs: (href: "https://matrix.to/#/@sumner:nevarro.space", target: "_blank", title: "Matrix"), [
          #si("matrix")
        ])
        #html.elem(
          "a",
          attrs: (class: "replace-email-link", href: "mailto:junk@sumnerevans.com", target: "_blank", title: "Email"),
          [ #nf("nf-cod-mail") ],
        )
        #html.elem("a", attrs: (href: "https://github.com/sumnerevans", target: "_blank", title: "GitHub"), [
          #si("github")
        ])
        #html.elem("a", attrs: (href: "https://www.linkedin.com/in/sumnerevans", target: "_blank", title: "LinkedIn"), [
          #nf("nf-dev-linkedin")
        ])
        #html.elem("a", attrs: (href: "https://www.youtube.com/@sumnerevans", target: "_blank", title: "YouTube"), [
          #si("youtube")
        ])
        #html.elem("a", attrs: (href: "/index.xml", target: "_blank", title: "RSS Feed"), [
          #nf("nf-md-rss")
        ])
      ])
      #nav-html(base-url)
    ]
    #body
    #html.div(class: "next-prev", [])
    #html.footer[
      #html.p[
        Built with #html.a(href: "https://gohugo.io/")[Hugo] using
        #html.a(href: "https://github.com/sumnerevans/sumnerevans.com/tree/master/themes/smol")[my fork of the smol theme].#html.span(id: "theme-switcher")
      ]
      #html.p[#sym.copyright 2026 Sumner Evans. All Rights Reserved.]
    ]
    #html.script(
      type: "text/javascript",
      "document.querySelectorAll('a.replace-email-link').forEach(e=>e.href=atob('bWFpbHRvOm1lQHN1bW5lcmV2YW5zLmNvbQ=='))",
    )
  ]
])

#let page-shell(body) = html.elem("main", [
  #html.elem("article", [
    #context html.div(class: "article-title", [
      #html.h1[#document.title]
    ])
    #html.div(class: "content", body)
  ])
])

#let root-template(body) = html_wrapper(body)
#let dir-template(body) = html_wrapper(page-shell(body))
#let page-template(body) = html_wrapper(page-shell(body))
