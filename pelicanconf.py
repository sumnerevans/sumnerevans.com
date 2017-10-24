#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = 'Sumner Evans'
SITENAME = 'Jonathan Sumner Evans'
SITEURL = ''
SITETITLE = 'Jonathan Sumner Evans'
SITESUBTITLE = 'Senior in Computer Science at Colorado School of Mines'
SITEDESCRIPTION = 'Sumner\'s portfolio, thoughts, and writings'
SITELOGO = SITEURL + '/images/profile.jpg'
FAVICON = SITEURL + '/images/favicon.ico'

CC_LICENSE = {
    'name': 'Creative Commons Attribution-ShareAlike',
    'version': '4.0',
    'slug': 'by-sa'
}

COPYRIGHT_YEAR = 2017

MAIN_MENU = True

PATH = 'content'

TIMEZONE = 'America/Denver'

THEME = 'Flex'
CUSTOM_CSS = 'static/custom.css'

DEFAULT_LANG = 'en'

STATIC_PATHS = ['images', 'static']
ARTICLE_SAVE_AS = '{date:%Y}/{slug}.html'
ARTICLE_URL = '{date:%Y}/{slug}.html'

GOOGLE_ANALYTICS = 'UA-104941015-1'
DISQUS_SITENAME = 'sumnerevans'

PLUGIN_PATHS = ['plugins']
PLUGINS = ['post_stats', 'representative_image', 'neighbors', 'related_posts']
PYGMENTS_STYLE = 'autumn'

IGNORE_FILES = ['.vim-template:.md']

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Social widget
SOCIAL = (('linkedin', 'https://www.linkedin.com/in/sumnerevans'),
          ('stack-overflow', 'http://stackoverflow.com/users/2319844/'),
          ('github', 'https://github.com/sumnerevans'),
          ('instagram', 'https://www.instagram.com/sumner.evans/'),
          ('facebook', 'https://www.facebook.com/sumner.evans98'),
          ('twitter', 'https://twitter.com/sumner_evans'),
          ('medium', 'https://medium.com/@sumner.evans'),
          ('youtube', 'https://www.youtube.com/channel/UCyrdRO4oJRpszr0ovN1FwBA/'),)

MENUITEMS = (('Archives', '/archives.html'),
             ('Categories', '/categories.html'),
             ('Tags', '/tags.html'),)

LINKS = (('resume', '/static/resume.pdf'),)

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
