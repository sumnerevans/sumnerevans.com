Respecting Theme Preferences on Your Website
############################################

:date: 2020-04-07 15:00
:authors: Sumner Evans
:category: Programming
:tags: JavaScript, Dark Theme, CSS, HTML
:slug: respect-theme-preferences
:status: published

You may have noticed that dark themes are becoming more and more common across
the computing landscape. Everything from `Windows 10`_, `macOS Mojave and
later`_, `iOS 13+ <iOS_>`_, and `Android 10+ <Android_>`_ to many `Linux
<linuxde1_>`_ `desktop <linuxde2_>`_ `environments <linuxde3_>`_ and many
`individual <browser1_>`_ `browsers <browser2_>`_ are including dark/light theme
toggle settings.

In addition, you may have noticed that some websites are now starting to respect
your OS and browser dark mode settings. For example, `StackOverflow now can
detect whether your browser or OS has dark mode enabled <so_>`_.

Because I *love* dark mode, I decided to see if I could make this website adhere
to the browser/OS settings for dark and light themes. Here's a demo of what I
was able to achieve:

.. raw:: html

   <p><b>Change theme to:</b></p>
   <div style="margin-bottom: 16px;">
     <a class="btn" href="javascript:void(0)" style="margin-right: 8px;" onclick="switchTheme('dark')">
       Dark Theme
     </a>
     <a class="btn" href="javascript:void(0)" style="margin-right: 8px;" onclick="switchTheme('light')">
       Light Theme
     </a>
     <a class="btn" href="javascript:void(0)" style="margin-right: 8px;"  onclick="switchTheme('browser')">
       Browser Theme
     </a>
   </div>

In this post, I'm going to share what I learned while implementing this for my
website. Hopefully this helps you implement light/dark theme adaptation for your
website.

.. _Windows 10: https://www.cnet.com/how-to/windows-10-dark-mode-is-here-turn-it-on-now/
.. _macOS Mojave and later: https://support.apple.com/en-us/HT208976
.. _iOS: https://support.apple.com/en-us/HT210332
.. _Android: https://www.digitaltrends.com/mobile/how-to-use-dark-mode-in-android/
.. _linuxde1: https://github.com/elementary-tweaks/elementary-tweaks
.. _linuxde2: https://wiki.gnome.org/Apps/Tweaks
.. _linuxde3: https://www.tecrobust.com/how-to-enable-dark-theme-dark-mode-in-manjaro-linux-kde/
.. _browser1: https://www.addictivetips.com/web/enable-the-dark-mode-on-chrome/
.. _browser2: https://www.howtogeek.com/359033/how-to-enable-dark-mode-in-firefox/
.. _so: https://meta.stackoverflow.com/questions/395949/dark-mode-beta-help-us-root-out-low-contrast-and-un-converted-bits

Three Tips for Creating a Dark Theme for your Website
=====================================================

The first thing you want to do is to actually create a dark theme for your
website. Obviously, each site will have unique challenges in designing a dark
theme, but here are a few things that I've found useful as I designed the dark
theme for this website.

1. **Don't use pure black and white. Ever.** It may be tempting to just use a
   pure black and pure white in your dark theme, but ends up being fairly
   unreadable. Take the following examples:

   .. raw:: html

      <div style="background-color: black; color: white; padding: 16px;">
        <p>
          This text is very unreadable because it has <i>too</i> much contrast.
        </p>
        <p>
          The <tt>background-color</tt> is <tt>black</tt> and the <tt>color</tt>
          is <tt>white</tt>.
        </p>
        <p>
          All of the letters kinda run together because your brain is
          concentrating on the high amount of contrast with the background. It's
          difficult for your brain to understand what's going on.
        </p>
      </div>
      <div style="background-color: #222; color: #ddd; padding: 16px;">
        <p>
          This text is much more readable because the contrast is not so stark.
        </p>
        <p>
          The <tt>background-color</tt> is <tt>#222</tt> and the <tt>color</tt>
          is <tt>#ddd</tt>.
        </p>
        <p>
          The letters stand out on the page distinctly, but the contrast is not
          distracting. It's much easier for your brain to concentrate on the
          actual content instead of the contrast with the background.
        </p>
      </div>

   Using a grey for your background color rather than pure black also gives you
   the option to use darker greys as accent colors. For example, for this site,
   if you turn on dark mode (you can turn it on via the links in the footer) the
   background color for the content you are reading is ``#333`` and the text
   color is ``#eee``. The sidebar on the left has a darker background color of
   ``#222``. This allows the sidebar to be darker than the content in both the
   light and dark themes.

2. **Don't just go and change all of the colors.** Some colors can be left
   the same or nearly the same. The link text is one example of a color that
   doesn't changed that much between light and dark themes on this site. I did
   do a slight modification to the colors to increase contrast with the grey
   background, but it was a very minor change.

3. **Dim your images.** Most of the time, images are naturally bright content
   which can be jarring in the middle of a dark-themed website. In order to
   counteract that, one option that has worked well for me is to dim the images
   by default. Then, on hover you can un-dim the images (restoring them to their
   full brightness). In my case, I set images to have a 70% opacity when not
   hovered, and a 100% opacity (no transparency) when it's hovered. For example,
   see the following image:

   .. image:: {static}/images/hackathon/2019-02-24-second-place.jpg
      :alt: My team winning Second Place
      :target: {filename}/hackathons/2019-02-24-hackcu.rst
      :width: 70%
      :align: center

   I use this dimming effect in light mode as well (but with only 90% opacity
   when not hovered) and it creates a nice effect there as well.

Detecting Theme Preference in CSS
=================================

Now that you have determined the styles that you want to use in dark mode, you
need to actually detect which theme the user prefers. It turns out to be
extremely easy to do in both CSS and JavaScript. I'll focus on CSS first.

There is a CSS standard media query called ``prefers-color-scheme`` (MDN_) that
is currently `supported by all major browsers except Internet Explorer
<caniuse_>`_. This allows you to add CSS overrides for when the user prefers a
dark theme. For example, if you have a very basic text site that has black text
on a white background by default, and white text with a black background in dark
mode, you can use the following CSS.

.. code:: CSS

    body {
      background-color: white;
      color: black;
    }

    @media (prefers-color-scheme: dark) {
      body {
        background-color: black;
        color: white;
      }
    }

The media query also supports ``preferred-color-scheme: light`` or
``preferred-color-scheme: no-preference`` if for example, you have a
dark-by-default site and you want to override the styles for light themes.

.. _caniuse: https://caniuse.com/#feat=mdn-css_at-rules_media_prefers-color-scheme
.. _MDN: https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme

Detecting Theme Preference in JavaScript
========================================

Sometimes, however, you may need to determine programatically what theme
preference the user has set. For example, you may want to give them some
indication of what theme your website is currently using. To do this, you can
take advantage of the ``window.matchMedia`` function (`MDN <mdn2_>`_) which
returns a |mql|_ object. You can query the object directly:

.. code:: javascript

   const mql = window.matchMedia('(prefers-color-scheme: dark)');
   alert(`You are using the ${mql.matches ? 'dark' : 'light'} theme.`);

or you can add a listener that will be called when the value changes:

.. code:: javascript

   window
    .matchMedia('(prefers-color-scheme: dark)')
    .addListener(mql => {
      alert(`Theme changed to ${mql.matches ? 'dark' : 'light'} theme.`);
    });

Obviously, you can pass any function you want to the ``addListener`` function,
I'm just passing a lambda here for brevity.

.. note::

   When you add a media query listener, it will not be called on page load, it
   will only be called when the theme actually changes. You will likely want
   your code to run both when the page loads and when the user changes their
   theme, so I recommend extracting the theme-dependent logic out to its own
   function like so:

   .. code:: javascript

      const mql = window.matchMedia('(prefers-color-scheme: dark)');
      function handleTheme() {
        // do your theme-dependent logic here, for example:
        alert(`You are using the ${mql.matches ? 'dark' : 'light'} theme.`);
      }

      handleTheme();
      mql.addListener(handleTheme);

.. _mdn2: https://developer.mozilla.org/en-US/docs/Web/API/Window/matchMedia
.. |mql| replace:: ``MediaQueryList``
.. _mql: https://developer.mozilla.org/en-US/docs/Web/API/MediaQueryList

Allowing Users to Override the Detected Theme on Your Site
==========================================================

Since you've gone to all this work already to make a dark and light theme for
your website, you may as well expose the functionality to the user even if their
browser or OS doesn't support setting a theme preference. Additionally, some
users may want to override the theme for some reason. To cater to these people,
you need to create a mechanism for overriding the browser-detected theme.
Accomplishing this task requires modifications to both your CSS and your
JavaScript.

First, you have to duplicate your dark-mode styles under a theme class on the
``<body>`` and make sure that your dark theme styles don't override the
user-chosen light theme. For example, the example above would become something
like:

.. code:: CSS

    body {
      background-color: white;
      color: black;
    }

    @media (prefers-color-scheme: dark) {
      body:not(.light-theme) {
        background-color: black;
        color: white;
      }
    }

    body.dark-theme {
      background-color: black;
      color: white;
    }

Now, if the user's color scheme preference is for dark mode *or* there is a
``dark-theme`` class on the ``<body>``, dark mode will be enabled. Additionally,
if there is a ``light-theme`` class on the ``<body>``, the dark theme styles
will not be applied, even if the browser or OS color scheme preference is set to
the dark theme.

.. tip::

   To avoid manual duplication of your CSS styles (and thus adhering to the DRY
   principle), you can use a CSS compiler such as SASS, SCSS, or LESS. For
   example, if you use SCSS you can declare a mixin that includes all of your
   dark-theme styles. Then, you can ``@include`` your mixin as the styles for
   both the media-query-based and class-based dark theme detection strategies.
   The example above would become:

   .. code:: scss

      @mixin dark-mode-rules {
        background-color: black;
        color: white;
      }

      @media (prefers-color-scheme: dark) {
        body:not(.light-theme) {
          @include dark-mode-rules;
        }
      }

      body.dark-theme {
        @include dark-mode-rules;
      }

   In this simple example, using the mixin actually adds code, but when you have
   many style overrides for your dark theme, it can greatly inprove your code
   maintainability.

The second thing you need to do is provide a mechanism for overriding the theme,
and persisting that preference. There are many ways of doing this, but I
recommend using |localstorage|_ to store the users theme preference since
there's really no point in putting it in a cookie. If a user preference exists
in ``localStorage``, then you can use JavaScript add the corresponding class to
the ``<body>`` tag. Your ``handleTheme`` function may end up looking something
like this:

.. code:: javascript

   const mql = window.matchMedia('(prefers-color-scheme: dark)');
   function handleTheme() {
     let theme = localStorage.getItem('themeOverride');
     if (theme !== 'light' && theme !== 'dark') {
       theme = darkSchemeWatch.matches ? 'dark' : 'light';
     }

     // do other theme-dependent processing here

     if (theme === 'dark') {
       document.body.classList.add('dark-theme');
       document.body.classList.remove('light-theme');
     } else {
       document.body.classList.add('light-theme');
       document.body.classList.remove('dark-theme');
     }
   }

Now, if you want to switch the theme programatically, all you have to do is
change the ``themeOverride`` value in ``localStorage`` and call the
``handleTheme`` function. You can do this in any way you want.

For example, this website provides a set of links in the footer which call a
``switchTheme`` function with the desired theme.

.. code:: html

   Switch to the
   <a href="javascript:void(0)" onclick="switchTheme('dark')">
     dark
   </a>|<a href="javascript:void(0)" onclick="switchTheme('light')">
     light
   </a>|<a href="javascript:void(0)" onclick="switchTheme('browser')">
     browser
   </a>
   theme
   ...
   <script>
     function switchTheme(themeOverride) {
       localStorage.setItem('themeOverride', themeOverride);
       handleTheme();
     }
   </script>

.. note::

   You may have noticed that with this JavaScript, we no longer technically
   *need* to have the dark theme CSS styles underneath ``@media
   (prefers-color-scheme: dark)`` selector in the CSS. However, I still
   recommend leaving it there as it will allow people who don't have JavaScript
   enabled to still benefit from your dark and light theme support via the
   browser or OS theme preference functionality.

.. |localstorage| replace:: ``localStorage``
.. _localstorage: https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage

Other Resources
===============

Here are a few other resources that helped me as I was implementing dark mode
for this website and as I was writing this article.

* `Supporting macOS Mojave's Dark Mode on the web - Kevin Chen <kevinchen_>`_
* `Use "prefers-color-scheme" to detect macOS dark mode with CSS and Javascript <medium_>`_
* `Dark Mode in CSS | CSS-Tricks <csstricks_>`_

.. _kevinchen: https://kevinchen.co/blog/support-macos-mojave-dark-mode-on-websites/
.. _medium: https://medium.com/@jonas_duri/enable-dark-mode-with-css-variables-and-javascript-today-66cedd3d7845
.. _csstricks: https://css-tricks.com/dark-modes-with-css/
