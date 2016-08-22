#!/bin/bash
apt-get -y update

# Install Apache2 and PHP
apt-get -y install apache2 libapache2-mod-php5 php5

# Create SCU2016 index.php
cat << EOF > /var/www/html/index.php
 <html>
 <body>
 <p align="center">
 <img src="http://systemcenteruniverse.com/Content/Images/Layout/SCUEurope_blue.png" alt="SCU Logo" style="margin-top: 100px; margin-bottom: 30px;">
 </p>
 <h1 align="center" style="font-family: Karla, Arial, sans-serif; font-size: 54px;"><?php echo gethostname(); ?></h1>
 </body>
 </html>
EOF

# Rename default index.html
mv /var/www/html/index.html /var/www/html/index.html.old

# Restart Apache
service apache2 restart
