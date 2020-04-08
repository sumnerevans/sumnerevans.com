#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
from datetime import datetime

AUTHOR = 'Sumner Evans'
SITENAME = 'Jonathan Sumner Evans'
SITEURL = ''
SITETITLE = 'Jonathan Sumner Evans'
SITESUBTITLE = 'Software Engineer at The Trade Desk'
SITEDESCRIPTION = "Sumner's portfolio, thoughts, and writings"
SITELOGO = '/images/profile-informal.jpg'

FAVICON = '/images/favicon-informal.ico'
APPLE_TOUCH_ICON = '/images/apple-touch-icon.png'
SITE_MANIFEST = '/extra/site.manifest'
MASK_ICON = '/images/safari-pinned-tab.svg'
BROWSER_COLOR = '#333333'

CC_LICENSE = {
    'name': 'Creative Commons Attribution-ShareAlike',
    'version': '4.0',
    'slug': 'by-sa',
}

COPYRIGHT_YEAR = datetime.now().year

MAIN_MENU = True

PATH = 'content'

TIMEZONE = 'America/Denver'

THEME = 'Flex'
CUSTOM_CSS = 'static/custom.css'

DEFAULT_LANG = 'en'

STATIC_PATHS = ['images', 'static', 'extra']
EXTRA_PATH_METADATA = {
    'extra/CNAME': {
        'path': 'CNAME'
    },
    'extra/google665b11e17b58ce89.html': {
        'path': 'google665b11e17b58ce89.html'
    },
    'extra/.htaccess': {
        'path': '.htaccess'
    },
    'extra/.well-known/matrix/client': {
        'path': '.well-known/matrix/client'
    },
    'extra/.well-known/matrix/server': {
        'path': '.well-known/matrix/server'
    },
}

ARTICLE_SAVE_AS = '{date:%Y}/{slug}.html'
ARTICLE_URL = '{date:%Y}/{slug}.html'

PLUGIN_PATHS = ['plugins']
PLUGINS = [
    'post_stats',
    'neighbors',
    'related_posts',
    'render_math',
    'representative_image',
]
PYGMENTS_STYLE = 'autumn'
PYGMENTS_STYLE_DARK = 'monokai'

ARTICLE_EXCLUDES = ['extra', 'scss']
IGNORE_FILES = [
    '.vim-template:.md',
    '.vim-template:.rst',
]

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Social widget
SOCIAL = (
    ('linkedin', 'https://www.linkedin.com/in/sumnerevans'),
    ('stack-overflow', 'http://stackoverflow.com/users/2319844/'),
    ('github', 'https://github.com/sumnerevans'),
    ('gitlab', 'https://gitlab.com/sumner'),
    ('instagram', 'https://www.instagram.com/sumner.evans/'),
    ('twitter', 'https://twitter.com/sumner_evans'),
    ('keybase', 'https://keybase.io/jsve'),
)

MENUITEMS = (
    ('Archives', '/archives.html'),
    ('Categories', '/categories.html'),
    ('Tags', '/tags.html'),
)

LINKS = (('resume', '/static/resume.pdf'), )
LINKS_IN_NEW_TAB = False

DEFAULT_PAGINATION = 15

# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = True

TYPOGRIFY = True

# Math Typsetting with MathJAX
MATH_JAX = {
    'tex_extensions': [
        'color.js', 'cancel.js', 'mhchem.js', 'AMSmath.js', 'AMSsymbols.js'
    ],
}

# Isso settings
# See https://posativ.org/isso/docs/configuration/client/
ISSO_URL = '//comments.sumnerevans.com'
ISSO_EMBED_JS_PATH = '/static/javascript/isso.min.js'

# Each of the options will have "data-isso-" appended to the front of the key.
# The value will remain the same, and must be a string.
ISSO_OPTIONS = {
    'avatar': 'false',
    'gravatar': 'true',
    'reply-to-self': 'true',
    'reply-notifications': 'true',
}
