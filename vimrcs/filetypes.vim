""""""""""""""""""""""""""""""
" => Markdown section
""""""""""""""""""""""""""""""

" Recognize .md as markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JSON section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert to human-editable JSON in your editor
nmap =j :%!python -m json.tool<CR>
