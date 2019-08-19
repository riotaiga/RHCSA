#!/bin/bash 

# pvcreate volumes to be mounted on the system 
pvcreate -v /dev/sdf1
pvcreate -v /dev/sdg1
pvcreate -v /dev/sdh1 

# vgcreate 
# builds a volume group with a single physical volume 

# vgchange -a n vgname 
# vgremove vgname 
vgcreate -s 256k -v vgname /dev/sdf1
vgcreate -s 256k -v vgname /dev/sdg1
vgcreate -s 256k -v vgname /dev/sdh1

# vgextend 
vgextend vgname /dev/sdf1
vgextend vgname /dev/sdg1
vgextend vgname /dev/sdh1

# lvcreate 
lvcreate -i 16 -I 16 -L 8g -v vgname -n lvol1 
lvcreate -i 16 -I 16 -L 8g -v vgname -n lvol2
lvcreate -i 16 -I 16 -L 8g -v vgname -n lvol3

# mkfs 
mke2fs -b 4096 /dev/vgname/lvol1
mke2fs -b 4096 /dev/vgname/lvol2
mke2fs -b 4096 /dev/vgname/lvol3

# mount 
mkdir -p /mnt/lvmvol1
mkdir -p /mnt/lvmvol2
mkdir -p /mnt/lvmvo13
e2fsck -p /dev/vgname/lvol1
e2fsck -p /dev/vgname/lvol2
e2fsck -p /dev/vgname/lvol3
mount /dev/vgname/lvol1 /mnt/lvmvol1
mount /dev/vgname/lvol1 /mnt/lvmvol2
mount /dev/vgname/lvol1 /mnt/lvmvol3
