# Create logical volume
fdisk /dev/sdb
  n -> t (8e) -> w
fdisk /dev/sdc
pvcreate /dev/sdb1 /dev/sdc1
pvdisplay

vgcreate vgname /dev/sdb1 /dev/sdc1
vgdisplay

lvcreate -L 100M vgname
lvcreate -L 101M vgname
lvcreate -L 102M vgname
lvdisplay

mkfs.xfs /dev/vgname/lvol0
mkfs.xfs /dev/vgname/lvol1
mkfs.xfs /dev/vgname/lvol2

mount /dev/vgname/lvol0 /mnt/vgname/lvol0
mount /dev/vgname/lvol1 /mnt/vgname/lvol1
mount /dev/vgname/lvol2 /mnt/vgname/lvol2
systemctl status /mnt/vgname/lvol2

# Resize LV
lvresize -L+100M /dev/vgname/lvol2

# Activate inactive
vgchange -ay

