# Dotfiles
My dotfiles for hyprland, wofi, waybar configs.
Installation instructions and scripts will be up soon (tm).

You can use whatever you want. :)

# Install packages

Install paru first:



```
sudo pacman -S base-devel
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepks -si
```

```
paru -S --needed --noconfirm - < package_list.txt
```

# Modify scripts

Make sure you change the `monitor` settings whatever you fit, copy over to your home `.config` and you done.
