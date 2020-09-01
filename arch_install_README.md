# Installation instruction for Arch Linux
Credits for the information below goes to the [official arch linux installation page](https://wiki.archlinux.org/index.php/Installation_guide)

## Image installation
1. Download the [latest arch linux image](https://www.archlinux.org/download/)
2. Verify the signature of the image
```shell
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig
```
3. Create a bootable usb flash drive
```shell
$ dd if=/path/to/arch_linux_image.iso of=/dev/sdX bs=1M status=progress
```
Note: Replace the path to your iso image and the path to the flash drive
4. Boot into your live arch flash drive
5. When the Arch menu appears, select Boot Arch Linux and press Enter to enter the installation environment.
6. Connect to the internet using [wpa_supplicant](https://wiki.archlinux.org/index.php/Wpa_supplicant)
```shell
$ sudo bash -c 'echo -e "ctrl_interface=/run/wpa_supplicant\nupdate_config=1" > /etc/wpa_supplicant/wpa_supplicant.conf'
$ wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
$ wpa_cli -i wlan0
  $ scan
  $ scan_results
  $ add_network
  $ set_network 0 ssid "MY-WiFi-SSID"
  $ set_network 0 psk "MY_WiFi_PASSWORD"
  $ enable_network 0
  $ save_config
  $ quit
$ dhcpcd wlan0
$ ping archlinux.org
```
7. Update the system clock
```shell
$ timedatectl set-ntp true
```
8. Partition the disks using fdisk

- Fixed partition scheme
```shell
$ fdisk -l  # list disks
$ fdisk /dev/sdX  # interactive partitioning of disk sdX
```
Create the partitions shown below
| Mount Point   | Partition | Partition Type         | Suggested Size |
|---------------|-----------|------------------------|----------------|
| /boot or /efi | /dev/sdX1 | EFI System Partition   | 260MB          |
| [swap]        | /dev/sdX2 | Linux swap             | 8GB            |
| /             | /dev/sdX3 | Linux x86\_64 root (/) | 23-32GB        | 
| /home         | /dev/sdX4 | Linux /home            | Rest           |

- btrfs partition scheme
Follow the guide on [partitioning with btrfs](https://wiki.archlinux.org/index.php/User:Altercation/Bullet_Proof_Arch_Install)
for managing dynamic root and home partitions
The result is the same as before, but the root and home partitions are actually
btrfs subvolumes now and there is also a subvolume for snapshots.

9. Install essential packages
```shell
$ pacstrap /mnt base linux linux-firmware dhcpcd vim wpa_supplicant sudo zsh dialog
```
10. Copy wpa\_supplicant.conf to the installed os
```shell
$ cp /etc/wpa_supplicant/wpa_supplicant.conf /mnt/etc/wpa_supplicant/wpa_supplicant.conf
```
11. Change root into the new system
```shell
$ arch-chroot /mnt
```
12. Do some setup
```shell
$ ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
$ hwclock --systohc
```
Uncomment en_US.UTF-8 UTF-8 and other needed locales in /etc/locale.gen, and generate them with:
```shell
$ echo "LANG=en_US.UTF-8" > /etc/locale.conf
$ locale-gen
$ systemd-firstboot --prompt-locale
$ timedatectl set-ntp 1
$ timedatectl set-timezone Europe/Brussels
$ hostnamectl set-hostname gkouros
$ echo "127.0.1.1	localhost.localdomain localhost" >> /etc/hosts
$ echo "::1	      localhost.localdomain localhost" >> /etc/hosts
$ echo "127.0.1.1	gkouros.localdomain gkouros" >> /etc/hosts
```
13. Connect to WiFi
```shell
$ wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
$ dhcpcd
```
14. Create a new user
```shell
$ useradd -m -G video wheel -s /bin/zsh gkouros
$ passwd gkouros
$ visudo
```
Command visudo opens /etc/sudoers. Uncomment the lines shown below:
- `root ALL=(ALL) ALL`
- `%wheel ALL=(ALL) ALL`
<!-- - `%sudo ALL=(ALL) ALL` -->
Add the lines below:
- `<USERNAME> <HOSTNAME>= NOPASSWD: /usr/bin/halt,/usr/bin/poweroff,/usr/bin/reboot`
- `Defaults passwd_timeout=0`
- `Defaults insults`
15. Install processor release and security updates
```shell
$ pacman -Sy intel-ucode
```
16. Update grub
Update the line `GRUB_CMDLINE_LINUX=""` to `GRUB_CMDLINE_LINUX="nouveau.modeset=0 nvidia-drm.modeset=1"`
to solve CPU lockup when executing lspci
```shell
$ grub-mkconfig -o /boot/grub/grub.cfg
```
16. Verify /etc/fstab
- Use blkid to verify UUIDs of partitions
- EFI partition must be of type vfat not ext4

## Desktop environemnt and Essential Apps
17. Install a graphical environment and graphics driver
```shell
$ pacman -S xorg-server xorg-apps nvidia nvidia-settings xorg-xinit xorg-xinput
```
Add hook to automatically update initramfs on nvidia modification
```
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=Linux

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```
18. Install the i3 / xfce4 desktop environments
```shell
$ pacman -S gnome gnome-extra
$ pacman -S plasma-meta kde-applications-meta
$ pacman -S i3-wm i3status
$ pacman -S xfce4
$ pacman -S gnome gnome-extra
```
19. Install a display manager (optional)
Choose gdm for gnome or i3
Choose sddm is for kde-plasma 
```shell
$ DM=gdm
$ pacman -S $DM
$ systemctl enable $DM.service
```
20. Generate User directories
```shell
$ pacman -S xdg-user-dirs
$ xdg-user-dirs-update
```
21. Install misc apps 
```shell
$ pacman -S \
  tmux \
  terminator \
  ...
```
22. Enable and start ssh service
```shell
$ systemctl enable sshd.service
$ systemctl start sshd.service
```
23. Install TLP for power management on battery mode
```shell
$ pacman -S tlp
```
24. Install a firewall
```shell
$ pacman -S ufw
$ systemctl enable ufw
$ systemctl start ufw
$ ufw allow ssh
```
25. Setup fstrim to increased SSD operating life (runs weekly)
```shell
$ pacman -S util-linux
$ systemctl enable fstrim.service
```
26. Add better fonts
```shell
$ pacman -S ttf-dejavu ttf-liberation noto-fonts
$ sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
$ sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
$ sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
```
Edit `/etc/profile.d/freetype2.sh` and uncomment the following line 
  `# uncomment line # export FREETYPE_PROPERTIES="truetype:interpreter-version=40"`  
Create the `/etc/fonts/local.conf file` and add the following
```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <match>
        <edit mode="prepend" name="family"><string>Noto Sans</string></edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family"><string>serif</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Serif</string></edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family"><string>sans-serif</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Sans</string></edit>
    </match>
    <match target="pattern">
        <test qual="any" name="family"><string>monospace</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Mono</string></edit>
    </match>
</fontconfig>
```
## Install Yaourt and community packages
```shell
$ pacman -S --needed base-devel git wget yajl
$ mkdir $HOME/repositories
$ git clone https://aur.archlinux.org/package-query.git $HOME/repositories/package-query
$ cd $HOME/repositories/package-query && makepkg -si --noconfirm
$ git clone https://aur.archlinux.org/yaourt.git $HOME/repositories/yaourt
$ cd $HOME/repositories/yaourt && makepkg -si --noconfirm
```

## Install a tiling window manager
```shell
$ pacman -S awesome xterm
$ cp -r /etc/xdg/awesome ~/.config/
```

## Miscellaneous apps
- dotfiles
- thunderbird (pacman)
- chrome (install from source)
- spotify 
- vlc
