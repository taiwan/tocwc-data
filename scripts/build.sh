#!/usr/bin/env bash
set -e

oldfile="courses.json"
newfile="./build/courses-new.json"

git config --global user.email "poying.me+circleci@gmail.com"
git config --global user.name "circleci"

git branch -D build || true
git checkout -b build
rm -rf build
mkdir build
git checkout origin/gh-pages "$oldfile"
./bin/tocwc-data "$newfile"

oldsize=`wc -c $oldfile | cut -d' ' -f1`
newsize=`wc -c $newfile | cut -d' ' -f1`

if [ $oldsize -gt $newsize ]
then
  echo "The old file is larger than the new one"
  exit 1
fi

if [ $oldsize -eq $newsize ]
then
  exit 0
fi

mv "$newfile" "$oldfile"
rm -rf build
git add .
git commit -m 'build'
git checkout gh-pages
git checkout build "$oldfile"
git add "$oldfile"
git commit -m "circleci ${date}"
git push