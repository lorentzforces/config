function! StyleDefault()
  augroup style_java
    autocmd!
    autocmd FileType java call SetIndent(4, "tabs")
  augroup END

  augroup style_javascript
    autocmd!
    autocmd FileType javascript call SetIndent(2, "tabs")
    autocmd FileType json call SetIndent(2, "tabs")
  augroup END

  augroup style_xml
    autocmd!
    autocmd FileType xml call SetIndent(2, "tabs")
    autocmd FileType xhtml call SetIndent(2, "tabs")
  augroup END

  augroup style_html
    autocmd!
    autocmd FileType html call SetIndent(2, "tabs")
  augroup END

  augroup style_vim
    autocmd!
    autocmd FileType vim call SetIndent(2, "tabs")
  augroup END

  bufdo doautocmd FileType
endfunc
command! StyleDefault call StyleDefault()

function! StyleGoogle()
  augroup style_java
    autocmd!
    autocmd FileType call SetIndent(2, "spaces")
  augroup END

  augroup style_javascript
    autocmd!
    autocmd FileType javascript call SetIndent(2, "spaces")
    autocmd FileType json call SetIndent(2, "spaces")
  augroup END

  augroup style_xml
    autocmd!
    autocmd FileType xml call SetIndent(2, "spaces")
    autocmd FileType xhtml call SetIndent(2, "spaces")
  augroup END

  augroup style_html
    autocmd!
    autocmd FileType html call SetIndent(2, "spaces")
  augroup END

  bufdo doautocmd FileType
endfunc
command! StyleGoogle call StyleGoogle()

