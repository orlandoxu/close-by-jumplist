
function! l:CheckIgnoreBuffer(buf_name) abort
  for i in g:close_by_jumplist_ignore_files
    if a.buf_name =~ i
      return 1
    endif
  endfor

  return 0
endf

function! l:GetPrevClosedBuffer() abort
  " getjumplist default buffer need reverse
  let l = getjumplist()
  if len(l[0]) == 0
    return -1
  endif

  let bufList = reverse(copy(l[0]))
  " now jumplist position
  let currJumpIdx = len(l[0]) - l[1] - 1
  " now bufNr. We need skip currnet buffer to search.
  let currBufferNr = winbufnr(winnr())
  
  " jumplist is start from 0
  let jumpIndex = 0
  for i in bufList
    " ignore the list of we don't care
    if jumpIndex < currJumpIdx
      let jumpIndex = jumpIndex + 1
    else
      " Cannot use bufname to check if buffer is exists, case bufname will
      " search unlisted buffer
      let tBufname = bufname(i.bufnr) 

      " Buffer exists and not current buffer
      if currBufferNr != i.bufnr && tBufname != '' && buflisted(i.bufnr) && !l:CheckIgnoreBuffer(tBufname)
        return jumpIndex - currJumpIdx
      endif
      let jumpIndex = jumpIndex + 1
    endif
  endfor

  " Cannot find any buffer we need to close
  return -1
endf

function! close_by_jumplist#common#close_by_jumplist() abort
  let jumpTimes = l:GetPrevClosedBuffer()
  " echo 'jump times:' . jumpTimes

  " if we cannot find any buffer to close! (100 jumplist positions have been searched)
  if jumpTimes < 0
    :bp\|bd #<CR>
    return
  endif

  " real jump back && close prev buffer
  execute "normal " . jumpTimes . "\<c-o>"
  execute ":bd #"
endf
