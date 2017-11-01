#!/usr/bin/env bash

oldfile="courses.json"
newfile="./build/courses-new.json"

git branch -D build || true
git branch -b build
rm -rf build
mkdir build
git checkout gh-pages "$oldfile"
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