cd ~/.vim-environment

echo 'set runtimepath+=~/.vim-environment

source ~/.vim-environment/vimrcs/basic.vim
source ~/.vim-environment/vimrcs/filetypes.vim
source ~/.vim-environment/vimrcs/plugins_config.vim
source ~/.vim-environment/vimrcs/extended.vim' > ~/.vimrc

echo "Full configuration set. Happy coding :-)"
