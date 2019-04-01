""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect('~/.vim_runtime/sources_forked/{}')
call pathogen#infect('~/.vim_runtime/sources_non_forked/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp= 0
let g:bufExplorerShowRelativePath= 1
let g:bufExplorerFindActive= 1
let g:bufExplorerSortBy= 'mru'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Coc
""""""""""""""""""""""""""""""
" Note: "It works on vim >= 8.1 and neovim >= 0.3.1.
" Prerequisites: Need to install node and yarn first
" Install using :call coc#util#install(), and create coc-settings.json (sample file on tmp/)
" :CocInstall coc-snippets for snipMate integration

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'


""""""""""""""""""""""""""""""
" => Fzf
""""""""""""""""""""""""""""""
" Sync Fzf.vim with fzf
set rtp+=/usr/local/opt/fzf

nnoremap <leader>. :Tags<Cr>
nnoremap <leader>l :Lines<Cr>

" Remove Status line
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Limelight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


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
