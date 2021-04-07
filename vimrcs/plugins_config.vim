""""""""""""""""""""""""""""""
" => Load vimplug paths
""""""""""""""""""""""""""""""

call plug#begin('~/.vim-environment/sources_non_forked')
  Plug 'scrooloose/nerdtree'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-commentary'
  Plug 'itchyny/lightline.vim'
  Plug 'honza/vim-snippets'
  Plug 'easymotion/vim-easymotion'
  Plug 'terryma/vim-expand-region'
  Plug 'tpope/vim-surround'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tpope/vim-fugitive'
  Plug 'skalnik/vim-vroom'
  Plug 'benmills/vimux'
  Plug 'tpope/vim-rails'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()


""""""""""""""""""""""""""""""
" => vim-nerdtree-syntax-highlight

""""""""""""""""""""""""""""""

let NERDTreeHighlightCursorline = 0
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeSyntaxEnabledExactMatches = ['node_modules', 'favicon.ico']

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['md']='31B53E'

let g:WebDevIconsDefaultFolderSymbolColor='F5C06F' " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor='689FB6' " sets the color for files that did not match any rule

"""""""""""""""""""""""""""""""
"" => bufExplorer plugin
"""""""""""""""""""""""""""""""
"let g:bufExplorerDefaultHelp= 0
"let g:bufExplorerShowRelativePath= 1
"let g:bufExplorerFindActive= 1
"let g:bufExplorerSortBy= 'mru'
"map <leader>o :BufExplorer<cr>


"""""""""""""""""""""""""""""""
"" => Coc
"""""""""""""""""""""""""""""""
"" Note: "It works on vim >= 8.1 and neovim >= 0.3.1.
"" Prerequisites: Need to install node and yarn first
"" Install using :call coc#util#install(), and create coc-settings.json (sample file on tmp/)

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Install plugins if not installed
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-solargraph'
  \ ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

"" Prettier configuration
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"""""""""""""""""""""""""""""""
"" => Fzf
"""""""""""""""""""""""""""""""
" Sync Fzf.vim with fzf
set rtp+=/usr/local/opt/fzf

" If installed using git
set rtp+=~/.fzf

nnoremap <leader>. :Tags<Cr>
nnoremap <leader>l :Lines<Cr>

" Leave the window attached to the button
let g:fzf_layout = { 'down': '~40%' }
" Optional enable preview window
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" Global path completion
imap <c-p> <plug>(fzf-complete-path)

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" Switch current directory to the selected one by typing :Cd
command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
  \ {'source': 'find '.(empty(<f-args>) ? '.' : <f-args>).' -type d',
  \  'sink': 'cd'}))


" This line sets the word SearchAg as an alias
" This alias is needed so we can use FZF for Ag, this means,
" search in the entire directory using Ag and render results in FZF.
" See vimrcs/basic.vim line 347 to see its use.
autocmd VimEnter * command! -bang -nargs=* SearchAg call fzf#vim#ag(<q-args>, {'options': '--exact --delimiter : --nth 4..'}, <bang>0)
nnoremap <Tab> :Buffers<cr>


" ag command suffix, [options]
function AgRaw(command_suffix, ...)
   return call('fzf#vim#grep', extend(['ag --nogroup --column --color  -- ''^(?=.)'' '.a:command_suffix, 1], a:000))
 endfunction

 " Search inside a specific folder
command! -bang -nargs=+ -complete=dir Rag call AgRaw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)


""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" Avoid open files in NERDTree pane
nnoremap <silent> <expr> <Leader>j (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

" Close vim if nerdtree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => vim-arpeggio()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Skip next char and keep in insert mode (useful when using with autopairs)
"call arpeggio#map('i', '', 0, 'kl', '<Esc>la')

""Skip previous char and keep in insert mode
"call arpeggio#map('i', '', 0, 'ds', '<Esc>i')


"""""""""""""""""""""""""""""""
"" => vim-easymotion
"""""""""""""""""""""""""""""""
" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

map <C-o> <Plug>(easymotion-bd-w)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vim expand region (Vim smart selection)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Use the global default + the following for ruby
call expand_region#custom_text_objects('ruby', {
      \ 'im' :1,
      \ 'am' :1,
      \ })


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vim-Gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
nnoremap <silent> <leader>d :GitGutterToggle<cr>
set updatetime=100
set signcolumn=yes


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vim-Go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Import libraries on save
let g:go_fmt_command = "goimports"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vim-visual-multi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Map Alt key for j and k to add cursors vertically
"" https://github.com/mg979/vim-visual-multi/wiki/Quick-start#adding-cursors-vertically
map ∆ <M-j>
map ˚ <M-k>

let g:VM_default_mappings = 0

let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<M-j>'
let g:VM_maps["Select Cursor Up"]   = '<M-k>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vimux ()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <space><space> :VimuxPromptCommand<CR>
nmap <C-space> :VimuxRunCommand("clear")<CR>
nmap <space>. :VimuxRunLastCommand<CR>
nmap <space>q :VimuxInterruptRunner<CR>

"Keep consistency with vim-vroom mappings
nmap <space>a :VimuxRunCommand("clear;bundle exec rspec --color")<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vim-vroom (Ruby test vimux integration)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vroom_use_vimux = 1
let g:vroom_clear_screen = 1
let g:vroom_write_all = 1

silent! map <unique> <space>f :VroomRunTestFile<CR>
silent! map <unique> <space>l :VroomRunNearestTest<CR>
silent! map <unique> <space>. :VroomRunLastTest<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vim-jsx
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:jsx_ext_required = 0
