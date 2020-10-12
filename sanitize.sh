#!/usr/bin/env bash

## Replace TABs
find . -iname '*.php' -type f -exec sed -i 's/\t/    /g' {} +
