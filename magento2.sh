#!/bin/bash

# upgrade mysql from 5.5 to 5.6
# sudo apt-get upgrade
# sudo apt-get update
# sudo apt-get -y install php5-xsl
# sudo apt-get -y install mysql-client-5.6 mysql-client-core-5.6
# sudo apt-get -y install mysql-server-core-5.6 mysql-server-5.6
# sudo service mysql start

# rename the scotchbox index incase we want to see any of the config params still
# mv /var/www/public/index.php /var/www/scotch-box-index.php

# clone the repo (this takes a long time)
# cd /var/www/public && git clone https://github.com/magento/magento2.git .

# run composer
# composer install

# make a magento mess
# cd /var/www/public/bin && php magento setup:install --db-host="127.0.0.1:3306" \
#                                  --db-name="scotchbox" \
#                                  --db-user="root" \
#                                  --db-password="root" \
#                                  --base-url="http://192.168.33.10" \
#                                  --admin-user="admin" \
#                                  --admin-password="Passw0rd" \
#                                  --admin-email="magento2@altavista.com" \
#                                  --admin-firstname="Magento" \
#                                  --admin-lastname="Rulz"

# install the bogus sample data
# composer config repositories.magento composer https://packages.magento.com
# git clone https://github.com/magento/magento2-sample-data.git ~/sample-data
# php -f ~/sample-data/dev/tools/build-sample-data.php -- --ce-source="/var/www/public"
# cd /var/www/public && php bin/magento setup:upgrade
cd /var/www/public && php bin/magento setup:di:compile
# cd /var/www/public/bin && php magento sampledata:deploy
