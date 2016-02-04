#!/bin/bash

while [ true ]; do
  echo "Trying to connect to $MEDIAWIKI_DB_HOST..."
  if [ cat < /dev/tcp/$MEDIAWIKI_DB_HOST/3306 ]; then
    break;
  fi
  sleep 3;
done

echo "$MEDIAWIKI_DB_HOST:3306 is reachable, continuing..."
sleep 2
