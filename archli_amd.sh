##not done
##dont judge me
echo "What is your name"
read user_name
echo "What is your password"
read password
echo "Wifi[1] or Ethernet[2]"
read dec
if [ $dec = '1' ]; then
	echo "Your Wifi name:"
  read wifi
  echo "Your wifi card name:"
  read wifi_card
  iwctl 
  station $wifi_card scan
  station $wifi_card connect $wifi
fi
echo "cfdisk[1] or fdisk[2]"
read dec
if [ $dec = '1' ]; then
 cfdisk
else
  fdisk /dev/sda
fi
echo "Your EFI partition name(ex. /dev/sda1):"
read efi
echo "Your root partition name(ex. /dev/sda2):"
read root
mkfs.ext4 $root
mkfs.vfat -F32 $efi
mount $root /mnt
mkdir /mnt/boot
mkdir /mnt/boot/EFI
mount $efi /mnt/boot/EFI
