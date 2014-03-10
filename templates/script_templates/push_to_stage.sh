#!/bin/bash
#
# Push a dev or bare repo for a web host to the stage site,
# and pull the database from live to stage.

LINUX_USER="%LINUX_USER%"
MYSQL_USER="%MYSQL_USER%"
MYSQL_PASSWORD="%MYSQL_PASSWORD%"
MYSQL_LIVE_DATABASE="%MYSQL_LIVE_DATABASE%"
MYSQL_STAGE_DATABASE="%MYSQL_STAGE_DATABASE%"
STAGE_GIT="%STAGE_GIT%"
TEMP_DIRECTORY='/home/'$LINUX_USER'/.'$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
TEMP_FILE=$TEMP_DIRECTORY'/'$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

# Update the files in the stage instance
cd $STAGE_GIT
git pull origin master

# Make a temporary directory to store the live database dump
mkdir $TEMP_DIRECTORY
chmod 700 $TEMP_DIRECTORY

# Dump the live database into the temp directory
mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_LIVE_DATABASE > $TEMP_FILE

# Drop all tables in the stage database
TABLES=$(mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $STAGE_DATABASE -e 'show tables' | awk '{print $1}' | grep -v '^Tables' )
for t in $TABLES; do
	mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $STAGE_DATABASE -e "drop table $t"
done

# Import the live database into the stage database
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $STAGE_DATABASE < $TEMP_FILE

# Remove the temporary directory and file
rm -R $TEMP_DIRECTORY





