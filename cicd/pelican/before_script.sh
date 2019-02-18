#! /bin/sh
set -e

# Requirements
apk update && apk upgrade && apk add git make nodejs nodejs-npm
pip install --upgrade pip
pip install -r requirements.txt
npm install -g sass
