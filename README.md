# Fully complete vim-environment

Over the last years, I have been using Vim as my default Text Editor. It helped me to improve my productivity and it's fully customizable. Hope it can help you.

This repository was inspired by the vim configuration provided by [amix](https://github.com/amix/vimrc)
### Prerequisites

In order to make every plugin work, the following stuff need to be installed:

 - Install [nodejs](https://nodejs.org/en/download/) and [yarn](https://yarnpkg.com/en/docs/install#mac-stable) as requirements for coc.vim
 - Install [fzf](https://github.com/junegunn/fzf) as a requirement for fzf.vim
 - Install [The silver searcher](https://github.com/ggreer/the_silver_searcher) as a requirement for Ag.vim
 - Install py >=2.6 or any py3 as a requirement for [UltiSnips](https://github.com/SirVer/ultisnips)

## Installation

To install the configuration, use the following commands:

```
git clone https://github.com/amix/vimrc.git ~/.vim-environment
sh ~/.vim-environment/install.sh
```

  -j8 is an optional performance optimization that became available in version 2.8, and fetches up to 8 submodules at a time in parallel


## How to install on Linux

If you have vim aliased as `vi` instead of `vim`, make sure to either alias it: `alias vi=vim`. Otherwise, `apt-get install vim`


## Included Plugins

I highly recommend reading the documentation of each plugin. You may find useful information and mappings.

* [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for the Perl module / CLI script 'ack'
* [ag.vim](https://github.com/rking/ag.vim): A much faster Ack
* [ale.vim](https://github.com/dense-analysis/ale): Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support.
* [auto pairs.vim](https://github.com/jiangmiao/auto-pairs): Insert or delete brackets, parens, quotes in pair
* [bufexplorer.zip](https://github.com/jlanzarotta/bufexplorer): Buffer Explorer / Browser. This plugin can be opened with `<leader+o>`
* [coc.vim](https://github.com/neoclide/coc.nvim): Intellisense engine for vim8 & neovim
* [emmet.vim](https://github.com/mattn/emmet-vim): Support for expanding abbreviations for HTML & CSS
* [fzf.vim](https://github.com/junegunn/fzf.vim): Fzf is a general-purpose command-line fuzzy finder
* [goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2): Remove all clutter and focus only on the essential. Similar to iA Writer or Write Room [Read more here](http://amix.dk/blog/post/19744)
* [IndentLine.vim](https://github.com/Yggdroot/indentLine): Display the indention levels with thin vertical lines.
* [limelight.vim](https://github.com/junegunn/limelight.vim) Hyper-focus writing in vim
* [NERD Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing `gf`
* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manages the runtime path of the plugins
* [mru.vim](https://github.com/vim-scripts/mru.vim): Plugin to manage Most Recently Used (MRU) files. Includes my own fork which adds syntax highlighting to MRU. This plugin can be opened with `<leader+f>`
* [ultisnips](https://github.com/SirVer/ultisnips): The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
* [vim-arpeggio](https://github.com/kana/vim-arpeggio): Plugin that allow you to map commands to multi-keystrokes
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment stuff out.  Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion. `gcu` uncomments a set of adjacent commented lines.
* [vim-easymotion.vim](https://github.com/easymotion/vim-easymotion.vim): Provides a much simpler way to use some motions in vim
* [vim-endwise](https://github.com/tpope/vim-endwise): Helps to end certain structures automatically
* [vim-expand-region](https://github.com/terryma/vim-expand-region): Allows you to visually select increasingly larger regions of text using the same key combination.
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter): Plugin which shows a git diff in the 'gutter' (sign column)
* [vim-snippets](https://github.com/honza/vim-snippets): contains snippets files for various programming languages.
* [vim-surround](https://github.com/tpope/vim-surround): Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more
* [vim-visual-multi](https://github.com/mg979/vim-visual-multi): Multiple cursors project for vim/neovim (wip)
* [vimux](https://github.com/benmills/vimux): Easily interact with tmux from vim.
<!-- * [yank-ring](https://github.com/vim-scripts/YankRing.vim): The YankRing plugin allows the user to configure the number of yanked, deleted and changed text -->

## Included color schemes

* [ayu-vim](https://github.com/ayu-theme/ayu-vim): Light, mirage (prefered) and dark themes.
* [lightline](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline for Vim.
* [onehalf](https://github.com/sonph/onehalf): A coloscheme based on Atom's one.
* [palenlight](https://github.com/drewtempelmeyer/palenight.vim): A dark color scheme for Vim/Neovim based off the Material Pale Night color scheme. (my favourite)
* [vim-solarized8](https://github.com/lifepillar/vim-solarized8): This is yet another Solarized theme.
* [nord-vim](https://github.com/arcticicestudio/nord-vim) An arctic, north-bluish clean and elegant Vim color theme.
* [vim-hybrid](https://github.com/w0ng/vim-hybrid): A dark colour scheme that combines the best of many plugins.

Here are a few screenshots to see how it looks:

*Palenlight*

![alt text](https://github.com/GAKINDUSTRIES/vim-environment/blob/master/img/palenlight.png)

*onehalf*

![alt text](https://github.com/GAKINDUSTRIES/vim-environment/blob/master/img/onehalf.png)

*nord*

![alt text](https://github.com/GAKINDUSTRIES/vim-environment/blob/master/img/nord.png)

*solarized8_flat*

![alt text](https://github.com/GAKINDUSTRIES/vim-environment/blob/master/img/solarized_flat.png)

*ayu*

![alt text](https://github.com/GAKINDUSTRIES/vim-environment/blob/master/img/ayu.png)


## Included modes

The modes included give support to the programming languages that I used to work with. You can remove any of them if you don't use it or add new ones.

* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script): Syntax highlight for CoffeeScript
* [vim-javascript](https://github.com/pangloss/vim-javascript): Provides syntax highlighting and improved indentation.
* [vim-jsx](https://github.com/mxw/vim-jsx): Syntax highlighting and indenting for JSX
* [vim-pug](https://github.com/digitaltoad/vim-pug): Syntax highlight for Jade
* [vim-less](https://github.com/groenewege/vim-less): Syntax highlighting, indenting and autocompletion for LESS
* [vim-markdown](https://github.com/tpope/vim-markdown): Folding
* [nginx.vim](https://github.com/vim-scripts/nginx.vim): Highlights configuration files for nginx
* [vim-go](https://github.com/fatih/vim-go):Adds Go language support for Vim
* [vim-bundler](https://github.com/tpope/vim-bundler): This is a lightweight bag of Vim goodies for Bundler, best accompanied by rake.vim and/or rails.vim.
* [vim-rails](https://github.com/tpope/vim-rails): Vim plugin for editing Ruby on Rails applications.While not strictly necessary, bundler.vim and dispatch.vim are installed as dependencies.


## How to include your own stuff?

After you have installed the setup you can create **~/.vim_runtime/my_configs.vim** to fill in any configurations that are important for you.

You can also install your own plugins via [pathogen](https://github.com/tpope/vim-pathogen).

## Key Mappings

Find a list of the most useful mappings [here](https://github.com/GAKINDUSTRIES/vim-environment/blob/master/doc/reminders.txt)
