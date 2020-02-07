#!/bin/bash

curDir=`pwd`

jupyter nbconvert --to html  --execute  StackOverflow2017.ipynb
mv StackOverflow2017.html index.html

mkdir -p /tmp/workspace
cp -r . /tmp/workspace
cd /tmp/workspace
git checkout -B gh-pages
git rm StackOverflow2017.ipynb
git rm publish.sh
git add -A
git commit -m "Update page"
git push -f origin gh-pages
cd $curDir
rm index.html
rm -rf /tmp/workspace
