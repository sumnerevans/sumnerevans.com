#! /bin/sh
set -e

# Requirements
apk update && apk upgrade && apk add git make
pip install --upgrade pip
pip install -r requirements.txt

# Clone in the theme
git clone https://github.com/alexandrevicenzi/Flex
