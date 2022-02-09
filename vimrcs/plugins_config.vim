""""""""""""""""""""""""""""""
" => Load vimplug paths
""""""""""""""""""""""""""""""

call plug#begin('~/.vim-environment/sources_non_forked')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'easymotion/vim-easymotion'
  Plug 'terryma/vim-expand-region'
  Plug 'airblade/vim-gitgutter'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'vim-test/vim-test'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'tpope/vim-commentary'
  Plug 'itchyny/lightline.vim'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-surround'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'ayu-theme/ayu-vim'
  Plug 'AndrewRadev/splitjoin.vim'
call plug#end()


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


"""""""""""""""""""""""""""""""
"" => Coc-explorer
"""""""""""""""""""""""""""""""
nnoremap <space>e :CocCommand explorer<CR>


"""""""""""""""""""""""""""""""
"" => Fzf
"""""""""""""""""""""""""""""""
" Sync Fzf.vim with fzf
set rtp+=/usr/local/opt/fzf

" If installed using git
set rtp+=~/.fzf

nnoremap <Leader>m :Mark<cr>
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

" Open files
nnoremap <Leader>j :Files<cr>

" This line sets the word SearchAg as an alias
" This alias is needed so we can use FZF for Ag, this means,
" search in the entire directory using Ag and render results in FZF.
" See vimrcs/basic.vim line 347 to see its use.
autocmd VimEnter * command! -bang -nargs=* SearchAg call fzf#vim#ag(<q-args>, {'options': '--exact --delimiter : --nth 4..'}, <bang>0)
nnoremap <Tab> :Windows<cr>
nnoremap <S-Tab> :Buffers<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0
nnoremap <silent> <leader>z :Goyo<cr>

" ag command suffix, [options]
function AgRaw(command_suffix, ...)
   return call('fzf#vim#grep', extend(['ag --nogroup --column --color  -- ''^(?=.)'' '.a:command_suffix, 1], a:000))
 endfunction

 " Search inside a specific folder
command! -bang -nargs=+ -complete=dir Rag call AgRaw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)


""""""""""""""""""""""""""""""
" => Open file under cursor
""""""""""""""""""""""""""""""
nmap <space>o <c-w>gf


"""""""""""""""""""""""""""""""
"" => Easy-Align
"""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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


" #############################################
"  Vim-test
" #############################################

let test#strategy = "kitty"

let test#ruby#bundle_exec = 1
let test#ruby#use_binstubs = 0

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> <space>l :TestNearest<CR>
nmap <silent> <space>f :TestFile<CR>
nmap <silent> <space>a :TestSuite<CR>
nmap <silent> <space>. :TestLast<CR>
nmap <silent> <space>v :TestVisit<CR>


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
