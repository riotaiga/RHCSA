#/bin/bash 


# disabling the automatic start:
# sudo systemctl disable httpd 

# re-enabling the start up boot:
# sudo systemctl enable httpd

#--------------------------#

# variable declarations

VH_NAME="felty"
VH_USER="root"
VH_DOC_ROOT_DIR=/var/www/${VH_NAME}/html
VH_LOG_DIR=/var/www/${VH_NAME}/log
DEFAULT_CONF_DIR=/etc/httpd/conf

# step 4 - Setting up Virtual Hosts (VH)

# creating the virtual host's document root directory
sudo mkdir -p $VH_DOC_ROOT_DIR
sudo chown -R $VH_USER:$VH_USER $VH_DOC_ROOT_DIR
# creating the virtual host's log directory
sudo mkdir -p /var/www/${VH_NAME}/log
# setting default permission to the web root dir
sudo chmod -R 755 /var/www
# creating a index file (index.html) - note: using HERE DOC technic
cat<<TEXT | sudo tee $VH_DOC_ROOT_DIR/index.html
<html>
  <head>
    <title>Welcome to ${VH_NAME}!</title>
  </head>
  <body>
    <h1>Success! The ${VH_NAME} virtual host is working!</h1>
  </body>
</html>
TEXT

# creating sites-available and sites-enabled directories
sudo mkdir /etc/httpd/sites-available /etc/httpd/sites-enabled

# copying the original default httpd.con before editing
sudo cp $DEFAULT_CONF_DIR/httpd.conf $DEFAULT_CONF_DIR/httpd.conf.backup

# appending instruction to include the following config files under the default httpd.conf
cat<<TEXT | sudo tee -a $DEFAULT_CONF_DIR/httpd.conf
IncludeOptional sites-enabled/*.conf
TEXT

# creating the virtual host's configuration file
cat<<CFGTXT | sudo tee /etc/httpd/sites-available/${VH_NAME}.conf
<VirtualHost *:80>
    ServerName $VH_NAME
    ServerAlias $VH_NAME
    DocumentRoot $VH_DOC_ROOT_DIR
    ErrorLog $VH_LOG_DIR/error.log
    CustomLog $VH_LOG_DIR/requests.log combined
</VirtualHost>
CFGTXT

# creating the above virtual host's config file from sites-available directory to sites-enable directory
sudo ln -s /etc/httpd/sites-available/${VH_NAME}.conf /etc/httpd/sites-enabled/${VH_NAME}.conf


# step 5 - TBD

# restart apache server
sudo systemctl restart httpd.service
