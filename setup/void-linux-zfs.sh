#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root."
    exit 1
fi

ping -c 1 1.1.1.1 > /dev/null 2>&1 || {
    echo "Error: No internet connection."
    exit 1
}

mkdir -p /etc/xbps.d
cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
sed -i 's|https://repo-default.voidlinux.org|https://repo-fastly.voidlinux.org|g' /etc/xbps.d/*-repository-*.conf

xbps-install -Suy xbps zfs gptfdisk

source /etc/os-release
export ID="$ID"
zgenhostid -f 0x00bab10c

export BOOT_DISK="/dev/nvme0n1"
export BOOT_PART="1"
export BOOT_DEVICE="${BOOT_DISK}p${BOOT_PART}"

export POOL_DISK="/dev/nvme0n1"
export POOL_PART="2"
export POOL_DEVICE="${POOL_DISK}p${POOL_PART}"

wipefs -a "$POOL_DISK"
wipefs -a "$BOOT_DISK"

sgdisk --zap-all "$POOL_DISK"
sgdisk --zap-all "$BOOT_DISK"

sgdisk -n "${BOOT_PART}:1m:+512m" -t "${BOOT_PART}:ef00" "$BOOT_DISK"

sgdisk -n "${POOL_PART}:0:-10m" -t "${POOL_PART}:bf00" "$POOL_DISK"

echo 'SomeKeyphrase' > /etc/zfs/zroot.key
chmod 000 /etc/zfs/zroot.key

zpool create -f -o ashift=12 \
 -O compression=lz4 \
 -O acltype=posixacl \
 -O xattr=sa \
 -O relatime=on \
 -O encryption=aes-256-gcm \
 -O keylocation=file:///etc/zfs/zroot.key \
 -O keyformat=passphrase \
 -o autotrim=on \
 -m none zroot "$POOL_DEVICE"

zfs create -o mountpoint=none zroot/ROOT
zfs create -o mountpoint=/ -o canmount=noauto zroot/ROOT/${ID}
zfs create -o mountpoint=/home zroot/home

zpool set bootfs=zroot/ROOT/${ID} zroot

zpool export zroot
zpool import -N -R /mnt zroot
zfs load-key -L prompt zroot

zfs mount zroot/ROOT/${ID}
zfs mount zroot/home

udevadm trigger

XBPS_ARCH=x86_64 xbps-install \
  -S -R https://repo-fastly.voidlinux.org/current \
  -r /mnt base-system

cp /etc/hostid /mnt/etc
mkdir /mnt/etc/zfs
cp /etc/zfs/zroot.key /mnt/etc/zfs

xchroot /mnt

cat << EOF >> /etc/rc.conf
KEYMAP="us"
HARDWARECLOCK="UTC"
EOF
ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime

cat << EOF >> /etc/default/libc-locales
en_US.UTF-8 UTF-8
en_US ISO-8859-1
EOF
xbps-reconfigure -f glibc-locales

passw

cat << EOF > /etc/dracut.conf.d/zol.conf
nofsck="yes"
add_dracutmodules+=" zfs "
omit_dracutmodules+=" btrfs "
install_items+=" /etc/zfs/zroot.key "
EOF

xbps-install -S zfs

zfs set org.zfsbootmenu:commandline="quiet loglevel=4" zroot/ROOT

zfs set org.zfsbootmenu:keysource="zroot/ROOT/${ID}" zroot

mkfs.vfat -F32 "$BOOT_DEVICE"

cat << EOF >> /etc/fstab
$( blkid | grep "$BOOT_DEVICE" | cut -d ' ' -f 2 ) /boot/efi vfat defaults 0 0
EOF

mkdir -p /boot/efi
mount /boot/efi

xbps-install -S zfsbootmenu gummiboot-efistub

generate-zbm

xbps-install -S refind

refind-install
rm /boot/refind_linux.conf

cat << EOF > /boot/efi/EFI/ZBM/refind_linux.conf
"Boot default"  "quiet loglevel=0 zbm.skip"
"Boot to menu"  "quiet loglevel=0 zbm.show"
EOF

exit

umount -n -R /mnt

zpool export zroot
reboot
