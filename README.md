# HI
This is my daily-driver home-manager setup using flakes, I use NixOS but
decided to use home-manager standalone and here we are

# INSTALLATION
I don't think anyone should copy another persons config files but instead get inspiration
from them but if you want to copy these, first refer to home-manager documentation
to install it and then clone this repo to ```.config/home-manager```

the exact install commands would be: 
```bash
git clone https://github.com/ahmetemregurdal/Home-Manager-config ~/.config/home-manager
nix run home-manager/master -- init --switch
```
Which requires nix flakes to be enabled. Refer to [Nix Wiki](https://nixos.wiki/wiki/Flakes)
