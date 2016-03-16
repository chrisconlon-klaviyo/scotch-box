#!/bin/bash

# get some ants
sudo apt-get upgrade
sudo apt-get update
sudo apt-get -y install ant

# rename the scotchbox index incase we want to see any of the config params still
mv /var/www/public/index.php /var/www/scotch-box-index.php

# clone the repo
cd /var/www/public && git clone https://github.com/shopware/shopware.git .

# un-template the config file
cp config.php.dist config.php

# =============================================
#  From: https://github.com/shopware/shopware
# =============================================

# change some permissions
chmod 755 config.php
chmod -R 755 var
chmod -R 755 web
chmod -R 755 files
chmod -R 755 media
chmod -R 755 engine/Shopware/Plugins/Community

# skipping ant build because it requires user input, this would be the output
echo "
#Project properties
#Wed, 16 Mar 2016 20:17:28 +0000

db.host=localhost
db.name=scotchbox
db.user=root
db.password=root
db.port=3306
app.path=
app.host=192.168.33.10

" >> build/build.properties

# run their build script
cd build && ant build-unit

# bring down and place the demo assets
cd .. && wget -O /var/www/public/test_images.zip http://releases.s3.shopware.com/test_images.zip
unzip /var/www/public/test_images.zip