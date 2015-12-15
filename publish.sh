#!/bin/sh

if [ -f index.html ]; then
  echo "Synchronizing..."
  aws s3 sync . s3://clock.fyi \
    --exclude '*.*' \
    --include '*.css' \
    --include '*.html' \
    --cache-control 'max-age=30' \
    --delete
else
  echo "You're not in the right directory, exiting..."
  exit
fi

echo Done
