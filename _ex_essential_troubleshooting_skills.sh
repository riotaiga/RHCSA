# Changing the Root Password 

# reboot your system 
# delete "rhgb quiet" and type "rd.break"
# ctrl x 

mount -o remount,rw /sysroot 
chroot /sysroot  # in the right sys root system 
passwd # to change the password 
touch /.autorelabel # creates a file and needed for SELinux

# Troubleshooting Filesystem Issues 

vim /etc/fstab # to create a problem 
mount -a # nothing is going to be mounted 
mkdir /nowhere 
mount -a 

# Troubleshooting Networking Issues 

# giving IP address without the subnet mask 
ip a d 192.168.56.103/24 dev enp0s3  # to delete the ip address 
ip a a 192.168.56.103/24 dev enp0s3  # to add the ip address 

# to fix the routing 
ip route show 
ip route default via 192.168.56.103 

# check the persistent configuration 
nmtui # make sure that the ipv4 connection is set to automatic 
dhclient # renew the requiest to the DHCP server 

# Troubleshooting Performance Issues 
top # to determine whether you want to free up space or not

# Troubleshooting Software Issues 


# Troubleshooting Memory Shortage 
top # to determine how much memory is being used. Maybe change up the priority
