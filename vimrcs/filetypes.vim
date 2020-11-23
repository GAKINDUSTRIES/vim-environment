""""""""""""""""""""""""""""""
" => Markdown section
""""""""""""""""""""""""""""""
" Recognize .md as markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JSON section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert to human-editable JSON in your editor
command! -bar -bang ToJson
      \ exec ':%!python -m json.tool' |
      \ exec ':set syntax=json'
