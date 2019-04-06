"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("mac") || has("macunix")
    set gfn=Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Hack:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim-environment/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

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

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc
