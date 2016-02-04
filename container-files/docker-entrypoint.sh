#!/bin/bash

cd /var/www/html/maintenance
echo "Configuring MediaWiki with install.php"
echo $MEDIAWIKI_SITE_NAME
echo $MEDIAWIKI_DB_HOST
echo $MEDIAWIKI_DB_USER
echo $MEDIAWIKI_DB_PASSWORD
echo $MEDIAWIKI_DB_NAME
echo $MEDIAWIKI_ADMIN_PASSWORD
echo $MEDIAWIKI_ADMIN_USER

echo "Waiting for mysql database"
check.sh

php install.php --scriptpath="" --dbname=$MEDIAWIKI_DB_NAME --dbuser=$MEDIAWIKI_DB_USER --dbpass=$MEDIAWIKI_DB_PASSWORD --dbserver=$MEDIAWIKI_DB_HOST --installdbpass=$MEDIAWIKI_DB_PASSWORD --installdbuser=$MEDIAWIKI_DB_USER --pass=$MEDIAWIKI_ADMIN_PASSWORD $MEDIAWIKI_SITE_NAME $MEDIAWIKI_ADMIN_USER

httpd -e debug -DFOREGROUND
