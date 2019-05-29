#!/bin/bash
set -e

while IFS=, read -r prefix name label || [[ -n "${prefix}" ]]; do
    mkdir -p build/modules

    cd build

    sed -e 's!__PREFIX__!'"${prefix}"'!' \
        -e 's!__NAME__!'"${name}"'!' \
        -e 's!__LABEL__!'"${label}"'!' \
        ../manifest.xml > manifest.xml

    cp -R ../languages/${prefix}/* modules

    zip -r ../packages/LanguagePack-${name}-${prefix}.zip manifest.xml modules

    cd .. && rm -fr build

done < packages.txt

git add .
git commit -am "publish"
git push
