#! /bin/sh
set -e

# Requirements
apk update && apk upgrade && apk add git make
pip install --upgrade pip
pip install -r requirements.txt
