"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rails mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open database.yml
command! -bar OpenDBconfig
  \ execute 'tabf config/database.yml'

" Use :db instead of :DBconfig
cnoreabbrev db OpenDBconfig

" Open _env
command! -bar OpenEnv
  \ execute 'tabf config/_env.rb'

" Use :env instead of :DBconfig
cnoreabbrev env OpenEnv

" Generates a ruby class definition based on the current file's path
function! GetRubyClass()
  let l:path = expand("%:.:r")
  let l:path = substitute(l:path, "app/[a-z]*/", "", "")
  let l:parts = split(l:path, "/")
  let l:output = ""

  for m in l:parts
   let m = substitute(m, '^\a', '\u&', 'g')
   let l:output = l:output . "::" . substitute(m, '\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)', '\u\1\2', 'g')
  endfor

  return l:output
endfunction

au FileType ruby nmap <leader>rc :let @+ = GetRubyClass()<cr>
