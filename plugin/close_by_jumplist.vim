" close-by-jumplist   Close buffer with jumplist
" Maintainer:         orlandoXu   <scuxsl@gmail.com>
" Version:            0.1

if exists('g:close_by_jumplist')
  finish
else
  let g:close_by_jumplist = 'yes'
endif

if !exists('g:close_by_jumplist_ignore_files')
  let g:close_by_jumplist_ignore_files = ['NERD_tree']
endif

command! -nargs=0 BdeleteByJumplist :call close_by_jumplist#common#close_by_jumplist()
