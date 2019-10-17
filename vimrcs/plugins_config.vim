""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect('~/.vim-environment/sources_forked/{}')
call pathogen#infect('~/.vim-environment/sources_non_forked/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => Ale
""""""""""""""""""""""""""""""
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}

let g:ale_linters = {
\                     'javascript': ['eslint'],
\                     'css': ['csslint'],
\                     'html':['htmlhint'],
\                   }

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

let g:ale_sign_warning='●'
hi ALEWarningSign ctermfg=yellow ctermbg=none


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

" If installed using git
set rtp+=~/.fzf

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

" This line sets the word SearchAg as an alias
" This alias is needed so we can use FZF for Ag, this means,
" search in the entire directory using Ag and render results in FZF.
" See vimrcs/basic.vim line 347 to see its use.
autocmd VimEnter * command! -bang -nargs=* SearchAg call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)


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
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 300
map <leader>f :MRU<CR>


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration to jump backward and forward
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-arpeggio()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Skip next char and keep in insert mode (useful when using with autopairs)
call arpeggio#map('i', '', 0, 'kl', '<Esc>la')

"Skip previous char and keep in insert mode
call arpeggio#map('i', '', 0, 'ds', '<Esc>i')


""""""""""""""""""""""""""""""
" => vim-easymotion
""""""""""""""""""""""""""""""

" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

map <C-o> <Plug>(easymotion-bd-w)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim expand region (Vim smart selection)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Use the global default + the following for ruby
call expand_region#custom_text_objects('ruby', {
      \ 'im' :1,
      \ 'am' :1,
      \ })


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
nnoremap <silent> <leader>d :GitGutterToggle<cr>
set updatetime=100
set signcolumn=yes


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-visual-multi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map Alt key for j and k to add cursors vertically
" https://github.com/mg979/vim-visual-multi/wiki/Quick-start#adding-cursors-vertically
map ∆ <A-j>
map ˚ <A-k>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimux ()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <space><space> :VimuxPromptCommand<CR>
nmap <C-space> :VimuxRunCommand("clear")<CR>
nmap <space>. :VimuxRunLastCommand<CR>
nmap <space>q :VimuxInterruptRunner<CR>

"Keep consistency with vim-vroom mappings
nmap <space>a :VimuxRunCommand("clear;bundle exec rspec --color")<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-vroom (Ruby test vimux integration)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vroom_use_vimux = 1
let g:vroom_clear_screen = 1
let g:vroom_write_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-jsx
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0
