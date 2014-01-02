#grok-vim

Pretty solid base for using vim on a daily basis.

##Installation

The plugins are setup as submodules and the vimrc must be linked to your home directory.

    cd ~
    git clone https://github.com/strangescript/grok-vim.git
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update

##Adding new modules

Adding modules is easy, for example, if we needed to add Tim Pope's git plugin, fugative.

    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."


##Upgrading modules

    git submodule foreach git pull origin master
