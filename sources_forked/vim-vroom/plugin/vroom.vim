" File:        vroom.vim
" Description: Vim plugin to run your Ruby tests
" Maintainer:  Mike Skalnik <hi@mikeskalnik.com>
" License:     MIT
" Version:     1.0.2
" Notes:       This code was originally pulled from Gary Bernhardt's .vimrc

command! -nargs=0 VroomRunTestFile call vroom#RunTestFile()
command! -nargs=0 VroomRunNearestTest call vroom#RunNearestTest()
command! VroomRunLastTest call vroom#RunLastTest()

if !exists("g:vroom_map_keys")
  let g:vroom_map_keys = 1
endif

if g:vroom_map_keys
  silent! map <unique> <space>f :VroomRunTestFile<CR>
  silent! map <unique> <space>l :VroomRunNearestTest<CR>
  silent! map <unique> <space>. :VroomRunLastTest<CR>
endif
