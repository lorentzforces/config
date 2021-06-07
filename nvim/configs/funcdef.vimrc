" show the highlight groups of the character under the cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" simple helper functions to set indentation to a specific number of columns

command! -nargs=+ Indent call SetIndent(<f-args>)

function! SetIndent(columns, char)
  call SetIndentNum(a:columns)
  call SetIndentChar(a:char)
endfunction

function! s:SetIndentNum(columns)
  let &l:tabstop=a:columns
  let &l:shiftwidth=a:columns
  let &l:softtabstop=a:columns
endfunction

function! s:SetIndentChar(char) abort
  if a:char == "tabs"
    setlocal noexpandtab
  elseif a:char == "spaces"
    setlocal expandtab
  else
    echoerr "Must specify ""spaces"" or ""tabs"""
  endif
endfunction
