# Install a new virtsion of kernel 

yum update kernel

# Enable packet forwarding 

vim /etc/sysctl.conf

cd /etc/systctl.d # administrator configuration 
cd /usr/lib/sysctl.d/ # default configuration 

systemctl reboot 
