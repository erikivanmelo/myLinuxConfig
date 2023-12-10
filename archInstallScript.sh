#!/bin/bash

# setea el teclado en un qwerty español
localectl set-keymap es

# Verifica que se esté ejecutando como root
if [ "$EUID" -ne 0 ]
  then echo "Por favor, ejecuta este script como root"
  exit
fi

# Enumera los discos disponibles
lsblk

# Solicita al usuario el disco donde se crearán las particiones
read -p "Por favor, introduce el disco (ejemplo: /dev/sda): " disk

# Limpia la tabla de particiones del disco seleccionado
echo "Limpiando la tabla de particiones en $disk..."
wipefs -a $disk

# Calcular la cantidad recomendada de swap
total_ram_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
total_ram_gb=$((total_ram_kb / 1024 / 1024))
recommended_swap=$((total_ram_gb * 2))

# Create partitions
echo "Creating partitions on $disk..."
parted -s "$disk" mklabel gpt
parted -s "$disk" mkpart primary ext4 1MiB 512MiB # EFI partition
parted -s "$disk" mkpart primary linux-swap 512MiB "${recommended_swap}GiB" # Swap partition
parted -s "$disk" mkpart primary ext4 "${recommended_swap}GiB" 100% # Root partition

# Format partitions
echo "Formatting partitions..."
mkfs.fat -F32 "${disk}1"
mkswap "${disk}2"
mkfs.ext4 "${disk}3"

# Mostrar información de las particiones
lsblk -f $disk

# Mount the root partition
mount "${disk}3" /mnt

# Create and mount the boot/EFI partition (if applicable)
mkdir -p /mnt/boot
mount "${disk}1" /mnt/boot

# Enable swap
swapon "${disk}2"

#base package instation
pacstrap /mnt base linux linux-firmware

#Generate the fstab file to define how disk partitions should be mounted:
genfstab -U /mnt >> /mnt/etc/fstab

#Enter the newly installed system using arch-chroot:
arch-chroot /mnt

# Establecer zona horaria
ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime

# Ajustar el reloj del sistema
hwclock --systohc

sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen

locale-gen

#set hostname
read -p "Escriba un hostname: " host
echo $host > /etc/hostname
echo "127.0.1.1 $host.localdomain $host"

echo "establezca una contraseña"
passwd

echo "bootloader instalation"
pacman -S grub efibootmgr networkmanager git 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

read -p "Escriba un userName: " name
useradd "-m -G wheel -s /bin/bash $name"

echo "establezca una contraseña de usuario"
passwd ${name}

echo "$name ALL=(ALL) ALL" | sudo EDITOR='tee -a' visudo

echo "KEYMAP=es" | sudo tee -a /etc/vconsole.conf

exit  # salir del chroot
umount -R /mnt  # desmontar particiones
reboot  # reiniciar el sistema

