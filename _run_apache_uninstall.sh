#!/bin/bash 

# Stopping the Apache 
sudo systemctl stop httpd 
# Removing Apache 
sudo yum remove httpd 

# Making directory for thr tar files...
sudo mkdir //etc/tarfiles 

#-----------------#

# Directory change 
cd //var/www/
# copying the felty directory 
sudo mv //var/www/felty //var/www/felty.backup
# craeting a tar file and removing the original
sudo tar -cvzpf felty.www.backup.$(date +%Y%m%d%H%M%S).tar.gz felty.backup/
sudo rm -rf //var/www/backup 

# moving tar file to the appropriate directory 
sudo mv felty.www.backup.$(date +%Y%m%d%H%M%S).tar.gz //etc/tarfiles 

#-----------------#

# Directory change 
cd //etc/httpd
# copying the configuration file for backup felty.conf in sites-available 
sudo mv //etc/httpd/sites-available/felty.conf //etc/httpd/sites-avilable/felty.conf.backup 

# tar files craetion (sites-available)
sudo tar -cvzpf felty.conf.sites-available.backup$(date +%Y%m%d%H%M%S).tar.gz sites-available/
sudo rm //etc/httpd/sites-available/felty.conf.backup 

# moving tarfile to the appropriate directory (sites-available) 
sudo mv felty.conf.sites-available.backup.$(date +%Y%m%d%H%M%S).tar.gz //etc/tarfiles 

# remove directory (sites-available) 
sudo rm -rf sites-available/

#-----------------#

# Directory Change 
cd //etc/httpd 
# copying the configuration file for backup felty.conf in sites-enabled 
sudo mv //etc/httpd/sites-enabled/felty.conf //etc/httpd/sites-enabled/felty.conf.backup

# tarfiles creation (sites-enabled)
sudo tar -cvpzf felty.conf

# Directory change 
cd //etc/httpd
# copying the configuration file for backup felty.conf in sites-enabled 
sudo mv //etc/httpd/sites-enabled/felty.conf //etc/httpd/sites-enabled/felty.conf.backup 

# tarfiles crating (sites-enabled) 
sudo tar -cvpzf felty.conf.sites-available.backkup

# tarfiles creation (sites-enabled)
sudo tar -cvpzf felty.conf.sites-enabled.backup.$(date +Y%m%d%H%M%S).tar.gz sites-enabled/
sudo rm //etc/httpd/sites-enabled/felty.conf.backup

# moving tar file to the appropriate directory (sites-enabled)
sudo mv felty.conf.sites-enabled.backup.$(date +%Y%m%d%H%M%S).tar.gz //etc/tarfiles

# remove directory 
sudo rm -rf sites-enabled/
