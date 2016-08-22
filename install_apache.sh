#!/bin/bash
apt-get -y update

# Install Apache2 and PHP
apt-get -y install apache2 php7.0 libapache2-mod-php7.0

# Create SCU2016 index.php
cat << EOF > /var/www/html/index.php
 <html>
 <body>
 <p align="center">
 <img src="http://systemcenteruniverse.com/Content/Images/Layout/SCUEurope_blue.png" alt="SCU Logo" style="margin-top: 100px; margin-bottom: 30px;">
 </p>
 <h1 align="center" style="font-family: Karla, Arial, sans-serif; font-size: 54px; color: darkgrey"><?php echo gethostname(); ?></h1>
 <h1 align="center" style="font-family: Karla, Arial, sans-serif; font-size: 34px; color: darkgrey"><?php echo date('Y-m-d H:i:s'); ?></h1>
 </body>
 </html>
EOF

# Rename default index.html
mv /var/www/html/index.html /var/www/html/index.html.old

# Restart Apache
service apache2 restart
