#!/bin/bash 

# FTP Services 
firewall-cmd --add-service=ftp 
firewall-cmd --add-service=http
firewall-cmd --add-service=https
firewall-cmd --add-service=ssh

systemctl list-unit-files | grep ftp
systemctl enable vsftpd
systemctl start vsftpd

# Security Rnhanced Linux Policy for the ftpd processes 
man ftpd_selinux
# sets the current state of particular SELinux boolean 
setsebool -P ftp_home_dir 1

# change the SELinux context of files 
semanage fcontext -a -t public_content_rw_t "/home/user-1/welcome.txt"

# To set file security context 
restorecon -F -R -v /home/user-1/welcome.txt

# permanant 
firewall-cmd --permanent  --add-service=ftp
firewall-cmd --permanent  --add-service=http
firewall-cmd --permanent  --add-service=https
firewall-cmd --permanent  --add-service=ssh

