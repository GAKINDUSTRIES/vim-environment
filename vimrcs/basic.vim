" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Replace common escape key to return to normal mode
map! jk <ESC>

" Fast saving
nmap <leader>w :w!<cr>

" Use system clipboard for copy and paste in Linux
set clipboard=unnamedplus

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

" Enables mouse in all modes (including Tmux). Useful for scrolling
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 5 lines to the cursor - when moving vertically using j/k
set so=5

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For fast scrolling
set ttyfast

" Don't redraw while executing macros (good performance config)
set lazyredraw

" set cursorline

" This selects the default regexp engine. |two-engines|
" The possible values are:
  " 0  automatic selection
  " 1  old engine
  " 2  NFA engine
" set regexpengine=0

" Faster redraw for ruby files
" autocmd FileType ruby setlocal regexpengine=1

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

try
  colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=UTF-8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
" set nobackup
" set nowb
" set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Use indents of 2 spaces
set smarttab

" Automatically indent braces
set cindent

" An indentation every 2 columns
set shiftwidth=2

" Let backspace delete indent
set tabstop=2

" Prevents inserting two spaces after punctuation on a join (J)
set softtabstop=2

set nojoinspaces

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Remove all trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Set line number at start
set number

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Redraw console
nmap <leader>R :redraw!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Horizontal resize of windows
nnoremap <silent> <Leader>+ :exe " resize +15 "<CR>
nnoremap <silent> <Leader>- :exe " resize -15 "<CR>

"Vertical resize of windows
nnoremap <silent> <Leader>> :exe "vertical resize +15 "<CR>
nnoremap <silent> <Leader>< :exe "vertical resize -15 "<CR>

"Normalize all split sizes, which is very handy when resizing terminal
map <Leader>= <C-w>=

" Create a new buffer (vertical by default)
map <leader>bn :vnew<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Move between buffers
map <leader>b<leader> :bnext<cr>
map <leader>bp :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabprevious<cr>
map <leader>tl :tabnext<cr>
map <S-l> :tabnext<cr>
map <S-h> :tabprevious<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>t<leader> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Disable status line. Improves scrolling somehow
" set noshowmode
" set noruler
" set noshowcmd

" Do not show status line
" set laststatus=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Remap VIM $ to last character, ignoring line break
map $ g_

" Enter a new line below in normal mode
nmap <CR> o<Esc>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <S-j> mz:m+<cr>`z
nmap <S-k> mz:m-2<cr>`z
vmap <S-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <S-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Note: works only on MacVim
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" bind K to grep word under cursor
nnoremap gv :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Use FZF for Ag (SearchAg as alias to avoid overwrite ag in other functions)
map <leader>g :SearchAg<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>


map <leader><Space> :call SearchAndReplace('')<Left><Left>

function SearchAndReplace(replacement)
  let l:pattern = expand("<cword>")

  execute "!Ag -l \"" . l:pattern . "\" | xargs perl -pi -E \'s/" . l:pattern . "/" . a:replacement . "/g\'"
  execute "!Ag \"" . a:replacement . "\""

  let @/ = l:pattern
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Copy current buffer path to clipboard
nmap <leader>fp :let @+ = expand("%")<cr>

" Clone a file into a given directory
nmap <leader>cp :call CopyFile()<cr>

" Delete file and buffer
nmap <leader>dl :call DeleteFile<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:fcall(fn, path, ...) abort
  return call(s:ffn(a:fn, a:path), [a:path] + a:000)
endfunction

function! s:ffn(fn, path) abort
  let ns = tr(matchstr(a:path, '^\a\a\+:'), ':', '#')
  let fn = ns . a:fn
  if len(ns) && !exists('*' . fn) && !has_key(s:loaded, ns) && len(findfile('autoload/' . ns[0:-2] . '.vim', escape(&rtp, ' ')))
    exe 'runtime! autoload/' . ns[0:-2] . '.vim'
    let s:loaded[ns] = 1
  endif
  if len(ns) && exists('*' . fn)
    return fn
  else
    return a:fn
  endif
endfunction

command! -bar -bang DeleteFile
  \ let s:file = fnamemodify(bufname(<q-args>),':p') |
  \ execute 'bdelete<bang>' |
  \ if !bufloaded(s:file) && s:fcall('delete', s:file) |
  \   echoerr 'Failed to delete "'.s:file.'"' |
  \ endif |
  \ unlet s:file

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! CopyFile()
  let new_file_name = input('New file name: ', expand('%:p'), 'file')
  exec ":saveas " . new_file_name
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag! \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
