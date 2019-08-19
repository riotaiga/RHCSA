# Configure your system to boot in multi-user target by default

systemctl get-default
systemctl set-default multi-user.taget 

# Persistently remove the options that hide startup messages while booting 

vim /etc/default/grub 
grub2-mkconfig -o /boot/grub2/grub.cfg 
reboot  # seeing if it worked

# To change back

systemctl set-default graphical.target 
systemctl isolate graphical.taget 

