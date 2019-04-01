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
