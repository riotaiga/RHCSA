 #!/bin/bash 

# Common Commands taht can be used 
ip link show
ip addr show enp0s3
ip route show

# Add ip add to hosts (non persistent)
ip addr add 192.168.0.10/24 dev enp0s3 
ip addr add 192.168.0.11/24 dev enp0s3
ssh root@192.168.0.10

# delete ip to hosts 
ip addr delete 192.168.0.10/24 dev enp0s3

# Network Manager mcli con show 
nmcli con show 
nmcli c s
nmcli con show "Wired connection 1"
nmcli dev show 

# Add ip to host (persistent)
nmcli con add con-name "static-ip" ifname enp03 autoconnect yes save yes type ethernet gw4 192.168.0.1 ip
nmcli con up static-ip 

# Network with nmtui 
nmtui
/etc/sysconfig/network-scripts/ifcfg-static-ip 

# Set Hostname and Name Resolution 
hostnamectl set-hostname server-2 

# Config directly 
vi /etc/sysconfig/network-scripts/ifcfg-enp0s3 
