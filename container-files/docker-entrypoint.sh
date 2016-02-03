#!/bin/bash

cd /templates
echo "Configuring LocalSettings.php"
echo $MEDIAWIKI_SITE_NAME
echo $MEDIAWIKI_DB_HOST
echo $MEDIAWIKI_DB_USER
echo $MEDIAWIKI_DB_PASSWORD
echo $MEDIAWIKI_DB_NAME

sed -i "s/%%SITENAME%%/$MEDIAWIKI_SITE_NAME/g" LocalSettings.php
sed -i "s/%%DB_HOSTNAME%%/$MEDIAWIKI_DB_HOST/g" LocalSettings.php
sed -i "s/%%DB_USER%%/$MEDIAWIKI_DB_USER/g" LocalSettings.php
sed -i "s/%%DB_PASSWORD%%/$MEDIAWIKI_DB_PASSWORD/g" LocalSettings.php
sed -i "s/%%DB_NAME%%/$MEDIAWIKI_DB_NAME/g" LocalSettings.php

mv LocalSettings.php /var/www/html/

httpd -e debug -DFOREGROUND
