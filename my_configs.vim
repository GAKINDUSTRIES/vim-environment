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
