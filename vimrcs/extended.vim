"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
  set background=dark
  set termguicolors

" Palenlight colorscheme CONF
	colorscheme palenight

  let g:lightline = { 'colorscheme': 'palenight' }
	let g:palenight_terminal_italics=1

" One half colorscheme CONF
  " colorscheme onehalfdark
  " let g:lightline = { 'colorscheme': 'onehalfdark' }

" Ayu colorscheme CONF
  " let ayucolor="light"  " for light version of theme
  " let ayucolor="mirage" " for mirage version of theme
  " let ayucolor="dark"   " for dark version of theme
	" colorscheme ayu

" Hybrid colorscheme CONF
  " colorscheme hybrid
  " let g:hybrid_custom_term_colors = 1
  " let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.

" Nord colorscheme CONF
	" colorscheme nord
	" let g:nord_italic = 1
	" let g:nord_italic_comments = 1
  "
" Solarized colorscheme CONF
    " Possible coloscheme options:
        " solarized8: the default Solarized theme;
        " solarized8_low: low-contrast variant;
        " solarized8_high: high-contrast variant;
        " solarized8_flat: ÒflatÓ variant (not present in the original Solarized, see screenshots above).
  " colorscheme solarized8_flat

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim-environment/my_configs.vim<cr>
autocmd! bufwritepost vimrc source ~/.vim-environment/my_configs.vim
call SourceIfExists("~/.vim-environment/my_configs.vim")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=~/.vim/undo-dir
set undofile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/

" Map Â½ to something useful
map Â½ $
cmap Â½ $
imap Â½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert parenthesis to highlighted word
vnoremap ) <esc>`>a)<esc>`<i(<esc>
" Insert parenthesis to highlighted word with space
vnoremap ( <esc>`>a ) <esc>`<i( <esc>

" Insert square brackets to highlighted word
vnoremap ] <esc>`>a]<esc>`<i[<esc>

" Insert square brackets to highlighted word with space
vnoremap [ <esc>`>a ]<esc>`<i[ <esc>

" Insert curly braces to highlighted word
vnoremap } <esc>`>a}<esc>`<i{<esc>
" Insert curly braces to highlighted word with space
vnoremap { <esc>`>a }<esc>`<i{ <esc>

" Insert double quotes to highlighted word
vnoremap " <esc>`>a"<esc>`<i"<esc>
" Insert single quotes to highlighted word
vnoremap ' <esc>`>a'<esc>`<i'<esc>
