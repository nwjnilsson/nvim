# Neovim setup
## Note to self
I was using debian for this experiment and neovim version > 0.8 was not available in the package manager. The original neovim repository contains detailed instructions on how to do this. For debian 12, the following dependencies should be enough to build:
    
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl

## Troubleshooting
### Treesitter failing on first install?
Uncomment the treesitter thing in packer.lua to make TSUpdate install correctly the first time. 
