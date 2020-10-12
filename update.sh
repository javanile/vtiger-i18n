#!/usr/bin/env bash

git pull https://github.com/javanile/vtiger-i18n.git master -X theirs --no-edit

bash release.sh
