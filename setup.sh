#!/bin/bash

# update system
sudo pacman -Syu --noconfirm

# yay install
git clone https://aur.archlinux.org/yay.git ~/.config/yay
cd ~/.config/yay
makepkg -si --noconfirm
cd

# basic files
mv ~/.config/Obrázky .
mv ~/.config/zshrc ~/.zshrc
mv ~/.config/rofi-power-menu ~/.local/bin

# install programs
yay -S adobe-source-han-sans-cn-fonts --noconfirm
yay -S adobe-source-han-sans-jp-fonts  --noconfirm
yay -S adobe-source-han-sans-kr-fonts --noconfirm
yay -S atool --noconfirm
yay -S bat --noconfirm
yay -S blueman --noconfirm
yay -S breeze --noconfirm
yay -S gdu --noconfirm
yay -S ncspot --noconfirm 
yay -S ttf-font-awesome --noconfirm
yay -S ttf-jetbrains-mono-nerd --noconfirm
yay -S cronie --noconfirm
yay -S kitty --noconfirm
yay -S yazi --noconfirm
yay -S dragon-drop-git --noconfirm
yay -S downgrade --noconfirm
yay -S swww --noconfirm
yay -S udiskie --noconfirm
yay -S hyprland-git --noconfirm
yay -S pyprland --noconfirm
yay -S hyprlock --noconfirm
yay -S hypridle --noconfirm
yay -S xdg-desktop-portal-hyprland --noconfirm
yay -S lxqt-policykit --noconfirm
yay -S trashy --noconfirm
yay -S subliminal --noconfirm
yay -S python-ffsubsync-venv --noconfirm
yay -S swaync --noconfirm
yay -S simple-mtpfs --noconfirm
yay -S brightnessctl --noconfirm
yay -S cantarell-fonts --noconfirm
yay -S xdg-desktop-portal-gtk --noconfirm
yay -S pulsemixer --noconfirm
yay -S calcurse --noconfirm
yay -S grimblast-git --noconfirm
yay -S waybar --noconfirm
yay -S tlp --noconfirm
yay -S aegisub --noconfirm
yay -S firefox --noconfirm
yay -S fzf --noconfirm
yay -S lynx --noconfirm
yay -S clamtk --noconfirm
yay -S cups --noconfirm
yay -S system-config-printer --noconfirm
yay -S gparted --noconfirm
yay -S gvfs --noconfirm
yay -S ufw --noconfirm
yay -S htop --noconfirm
yay -S libreoffice-fresh --noconfirm
yay -S libreoffice-fresh-cs --noconfirm
yay -S man-db --noconfirm
yay -S mpv --noconfirm
yay -S mpv-mpris --noconfirm
yay -S fastfetch --noconfirm
yay -S neovim --noconfirm
yay -S newsboat --noconfirm
yay -S ntfs-3g --noconfirm
yay -S python-pipx --noconfirm
yay -S deluge --noconfirm
yay -S qimgv-git --noconfirm
yay -S qt5ct --noconfirm
yay -S qt5-wayland --noconfirm
yay -S qt6-wayland --noconfirm
yay -S qt6ct --noconfirm
yay -S reflector --noconfirm
yay -S subliminal --noconfirm
yay -S thunderbird --noconfirm
yay -S timeshift --noconfirm
yay -S ttf-meslo-nerd --noconfirm
yay -S ttf-ms-win11-auto --noconfirm
yay -S ttf-roboto --noconfirm
yay -S noto-fonts-emoji --noconfirm
yay -S unrar --noconfirm
yay -S unzip --noconfirm
yay -S zip --noconfirm
yay -S veracrypt --noconfirm
yay -S ventoy-bin --noconfirm
yay -S xidel-bin --noconfirm
yay -S yt-dlp --noconfirm
yay -S wl-clipboard --noconfirm
yay -S rofi-wayland --noconfirm
yay -S rofi-calc-git --noconfirm
yay -S wlsunset --noconfirm
yay -S xdg-user-dirs --noconfirm
yay -S zathura --noconfirm
yay -S zathura-pdf-mupdf --noconfirm
yay -S zathura-cb --noconfirm
yay -S zsh --noconfirm
yay -S nwg-look --noconfirm
yay -S wf-recorder --noconfirm
yay -S perl-image-exiftool --noconfirm
yay -S xorg-xhost --noconfirm
yay -S zoxide --noconfirm

# install drivers
yay -S xf86-video-amdgpu --noconfirm
yay -S intel-media-driver --noconfirm
yay -S intel-ucode --noconfirm
yay -S lib32-vulkan-intel --noconfirm
yay -S libva-intel-driver --noconfirm
yay -S vulkan-intel --noconfirm

# update file saving location
xdg-user-dirs-update

# services
sudo systemctl enable tlp 
sudo systemctl enable ufw 
sudo ufw enable 
sudo systemctl enable cronie 
sudo systemctl enable cups 
sudo updatedb 
sudo systemctl disable NetworkManager-wait-online.service
sudo systemctl enable reflector.timer

# set default xdg
xdg-mime default libreoffice-writer.desktop application/vnd.openxmlformats-officedocument.wordprocessingml.document

xdg-mime default libreoffice-impress.desktop application/vnd.openxmlformats-officedocument.presentationml.presentation

xdg-mime default libreoffice-calc.desktop application/vnd.openxmlformats-officedocument.spreadsheetml.sheet

xdg-mime default firefox.desktop c-scheme-handler/http    


# složky
sudo mkdir /mnt/Disk2 && sudo chown $USER:$USER /mnt/Disk2
sudo mkdir /mnt/android && sudo chown $USER:$USER /mnt/android
mkdir .themes && mkdir .icons

# Bootloader theme
sudo mv ~/.config/Grub-Theme-Virtuaverse /boot/grub/themes

# vim-plugged
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Yazi chmod plugin
ya pack -a yazi-rs/plugins#chmod

# Yazi archive plugin
ya pack -a KKV9/compress

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

