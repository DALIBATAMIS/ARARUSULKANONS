#!/bin/bash

set -e

if ! command -v sassc &> /dev/null
then
    echo "Sassc Couldn't be found. Install it"
    exit 1
fi

set -x

# rm -fdr public/css/*.css

for filename in public/css/*.scss; do
    sassc -t compressed $filename > "${filename%.scss}0.css"
done