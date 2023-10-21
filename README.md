# Neovim setup
## Note to self
I was using debian for this experiment and neovim version > 0.8 was not available in the package manager. The original neovim repository contains detailed instructions on how build it from source, however. For debian 12, the following dependencies should be enough to build:
    
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl

Also, install [Packer](https://github.com/wbthomason/packer.nvim) and [ripgrep](https://github.com/BurntSushi/ripgrep) (for plugins).

Use

    git clone https://github.com/gfx-jonte/neovim/ ~/$USER/.config/nvim/


## Troubleshooting
### Treesitter failing on first install?
Uncomment the treesitter thing in packer.lua to make TSUpdate install correctly the first time. 
