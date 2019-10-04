cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)

echo "set runtimepath+=$DOTFILES_ROOT

source $DOTFILES_ROOT/vimrcs/basic.vim
source $DOTFILES_ROOT/vimrcs/filetypes.vim
source $DOTFILES_ROOT/vimrcs/plugins_config.vim
source $DOTFILES_ROOT/vimrcs/extended.vim" > ~/.vimrc

echo "Full configuration set. Happy coding :-)"
