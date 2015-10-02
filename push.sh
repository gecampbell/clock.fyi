#!/bin/sh

if [ -d site ]; then
  cd site
  echo "Synchronizing..."
  aws s3 sync . s3://clock.fyi \
    --cache-control 'max-age=300' \
    --delete
else
  echo "Can't find the site/ directory, exiting..."
  exit
fi

echo Done