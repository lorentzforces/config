set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

" this theme really only works with true color terminals
set t_Co=256
let g:colors_name = "hubris"

let testMagenta = '#ff00ff'

let dark_grey = '#282828'
let dull_red = '#771313'
let dull_green = '#447152'
let dull_yellow = '#413c00'
let dull_blue = '#43698d'
let dull_orange = 'b45d10'
let bright_orange = '#f39745'
let dull_purple = '#7f3f98'
let bright_purple = '#bb83d1'
let off_white = '#cccccc'
let mid_grey = '#808080'
let bright_red = '#d60010'
let bright_green = '#6fdbb2'
let bright_yellow = '#b1a400'
let bright_blue = '#00b8ff'
let pure_white = '#ffffff'
let pure_black = '#010101' " hacky workaround for #000000 not working in some guis

" terminal colors
let g:terminal_color_0 = dark_grey
let g:terminal_color_1 = dull_red
let g:terminal_color_2 = dull_green
let g:terminal_color_3 = dull_yellow
let g:terminal_color_4 = dull_blue
let g:terminal_color_5 = dull_orange
let g:terminal_color_6 = dull_purple
let g:terminal_color_7 = off_white
let g:terminal_color_8 = mid_grey
let g:terminal_color_9 = bright_red
let g:terminal_color_10 = bright_green
let g:terminal_color_11 = bright_yellow
let g:terminal_color_12 = bright_blue
let g:terminal_color_13 = bright_orange
let g:terminal_color_14 = bright_purple
let g:terminal_color_15 = pure_white

" editor interface colors
exe 'highlight Cursor gui=NONE guifg=' . dark_grey 'guibg=' . off_white
exe 'highlight Normal gui=NONE guifg=' . off_white 'guibg=' . dark_grey
exe 'highlight Visual gui=NONE guifg=' . off_white 'guibg=' . mid_grey
exe 'highlight VisualNOS gui=NONE guifg=' . off_white 'guibg=' . mid_grey
exe 'highlight WildMenu gui=NONE guifg=' . dark_grey 'guibg=' . bright_orange
exe 'highlight NonText gui=italic guifg=' . mid_grey
exe 'highlight ErrorMsg gui=NONE guifg=' . dark_grey 'guibg=' . bright_yellow
exe 'highlight LineNr gui=NONE guifg=' . mid_grey 'guibg=' . pure_black
exe 'highlight CursorLineNR gui=NONE guifg=' . bright_orange 'guibg=' . pure_black
exe 'highlight WarningMsg gui=italic guifg=' . bright_yellow
exe 'highlight ModeMsg gui=NONE guifg=' . dark_grey 'guibg=' . bright_orange
exe 'highlight MoreMsg gui=NONE guifg=' . pure_white
exe 'highlight VertSplit gui=NONE guifg=' . pure_black 'guibg=' . dark_grey
exe 'highlight Directory gui=bold guifg=' . bright_blue
exe 'highlight SpecialKey gui=italic guifg=' . pure_white
exe 'highlight TabLine gui=NONE guifg=' . off_white 'guibg=' . pure_black
exe 'highlight TabLineSel gui=NONE guifg=' . bright_orange 'guibg=' . dark_grey
exe 'highlight TabLineFill gui=NONE guibg=' . pure_black
exe 'highlight StatusLine gui=NONE guifg=' . bright_orange 'guibg=' . pure_black
exe 'highlight StatusLineNC gui=NONE guifg=' . mid_grey 'guibg=' . pure_black
exe 'highlight StatusLineFlag gui=bold guifg=' . bright_purple 'guibg=' . pure_black
exe 'highlight StatusLineModified gui=bold guifg=' . dull_green 'guibg=' . pure_black
exe 'highlight PMenu gui=NONE guifg=' . off_white 'guibg=' . pure_black
exe 'highlight PMenuSel gui=NONE guifg=' . bright_orange 'guibg=' . mid_grey
exe 'highlight PMenuSbar gui=NONE guibg=' . off_white

" editor contextual colors
exe 'highlight CursorLine guibg=' . pure_black
exe 'highlight Search gui=NONE guifg=' . dark_grey 'guibg=' . bright_blue
exe 'highlight IncSearch gui=NONE guifg=' . dark_grey 'guibg=' . bright_blue
exe 'highlight MatchParen gui=bold guifg=' . dark_grey 'guibg=' . bright_blue

" diff colors
exe 'highlight DiffChange gui=NONE guifg=' . off_white 'guibg=' . dull_blue
exe 'highlight DiffText gui=NONE guifg=' . dark_grey 'guibg=' . bright_blue
exe 'highlight DiffDelete gui=NONE guifg=' . off_white 'guibg=' . dull_red
exe 'highlight diffRemoved gui=NONE guifg=' . off_white 'guibg=' . dull_red
exe 'highlight DiffAdd gui=NONE guifg=' . off_white 'guibg=' . dull_green
exe 'highlight diffAdded gui=NONE guifg=' . off_white 'guibg=' . dull_green
exe 'highlight diffFile gui=NONE guifg=' . bright_orange
exe 'highlight diffLine gui=NONE guifg=' . pure_white
exe 'highlight diffIndexLine gui=NONE guifg=' . pure_white


" syntax colors
exe 'highlight Underlined gui=underline guifg=' . off_white
exe 'highlight Title gui=NONE guifg=' . dark_grey 'guibg=' . mid_grey
exe 'highlight Comment gui=italic guifg=' . mid_grey
exe 'highlight Typedef gui=NONE guifg=' . bright_red
exe 'highlight String gui=NONE guifg=' . bright_orange
exe 'highlight Debug gui=NONE guifg=' . bright_yellow
exe 'highlight Conditional gui=NONE guifg=' . off_white
exe 'highlight Special gui=NONE guifg=' . pure_white
exe 'highlight SpecialChar gui=NONE guifg=' . pure_white
exe 'highlight Delimiter gui=NONE guifg=' . pure_white
exe 'highlight StorageClass gui=NONE guifg=' . bright_red
exe 'highlight Exception gui=NONE guifg=' . bright_red
exe 'highlight Function gui=NONE guifg=' . off_white
exe 'highlight Label gui=NONE guifg=' . bright_red
exe 'highlight Keyword gui=NONE guifg=' . bright_red
exe 'highlight Constant gui=NONE guifg=' .bright_red
exe 'highlight Repeat gui=NONE guifg=' .bright_red
exe 'highlight Type gui=NONE guifg=' . bright_red
exe 'highlight Identifier gui=NONE guifg=' . off_white
exe 'highlight Statement gui=NONE guifg=' . bright_red
exe 'highlight Operator gui=NONE guifg=' . bright_red
exe 'highlight Character gui=NONE guifg=' . bright_purple
exe 'highlight Float gui=NONE guifg=' . bright_purple
exe 'highlight Number gui=NONE guifg=' . bright_purple
exe 'highlight Boolean gui=NONE guifg=' . bright_purple
exe 'highlight Macro gui=NONE guifg=' . dull_purple
exe 'highlight PreProc gui=NONE guifg=' . dull_purple
exe 'highlight PreCondit gui=NONE guifg=' . dull_purple
exe 'highlight Define gui=NONE guifg=' . bright_red
exe 'highlight Include gui=NONE guifg=' . dull_purple
exe 'highlight Tag gui=underline'
exe 'highlight Todo gui=NONE guifg=' . dark_grey 'guibg=' . bright_yellow
exe 'highlight Error gui=NONE guifg=' . dark_grey 'guibg=' . dull_yellow
exe 'highlight Whitespace gui=italic guifg=' . mid_grey
exe 'highlight NonText gui=italic guifg=' . mid_grey

" syntax vim
exe 'highlight vimCommand gui=NONE guifg=' . bright_red 'guibg=NONE'
exe 'highlight vimExecute gui=NONE guifg=' . bright_red 'guibg=NONE'
exe 'highlight vimHighlight gui=NONE guifg=' . bright_red 'guibg=NONE'
exe 'highlight vimOption gui=NONE guifg=' . bright_red 'guibg=NONE'

" syntax shell
exe 'highlight shQuote gui=NONE guifg=' . bright_orange 'guibg=NONE'
exe 'highlight shDeref gui=NONE guifg=' . pure_white 'guibg=NONE'

" syntax git
exe 'highlight gitcommitSummary gui=NONE guifg=' . bright_orange 'guibg=NONE'
exe 'highlight gitcommitOverflow gui=NONE guifg=' . bright_yellow 'guibg=NONE'
exe 'highlight gitcommitBlank gui=NONE guifg=' . dark_grey 'guibg=' . bright_yellow
exe 'highlight gitcommitBranch gui=NONE guifg=' . dark_grey 'guibg=' . bright_orange
exe 'highlight gitcommitHeader gui=NONE guifg=' . pure_white 'guibg=NONE'
exe 'highlight gitrebaseCommit gui=NONE guifg=' . bright_blue 'guibg=NONE'
exe 'highlight gitrebaseHash gui=NONE guifg=' . bright_blue 'guibg=NONE'
exe 'highlight gitrebaseSummary gui=NONE guifg=' . off_white 'guibg=NONE'

" syntax java
exe 'highlight javaExternal gui=NONE guifg=' . bright_red
exe 'highlight javaStorageClass gui=NONE guifg=' . bright_red
exe 'highlight javaScopeDecl gui=NONE guifg=' . bright_red
exe 'highlight javaTypedef gui=NONE guifg=' . bright_red
exe 'highlight javaBoolean gui=NONE guifg=' . bright_red
exe 'highlight javaConditional gui=NONE guifg=' . bright_red
exe 'highlight javaExceptions gui=NONE guifg=' . bright_red
exe 'highlight javaCommentTitle gui=italic guifg=' . mid_grey

" syntax xml
exe 'highlight xmlTagName gui=NONE guifg=' . bright_red
exe 'highlight xmlAttrib gui=NONE guifg=' . off_white

" syntax html
exe 'highlight htmlTagN gui=NONE guifg=' . bright_red

" syntax javascript
exe 'highlight javaScriptException gui=NONE guifg=' . bright_red
exe 'highlight javaScriptIdentifier gui=NONE guifg=' . bright_red
exe 'highlight javaScriptConditional gui=NONE guifg=' . bright_red
exe 'highlight javaScriptBoolean gui=NONE guifg=' . bright_red
exe 'highlight javaScriptNumber gui=NONE guifg=' . bright_purple

" syntax json
" TODO: do something about json errors (there are a lot of varieties)
exe 'highlight jsonKeyword gui=NONE guifg=' . off_white
exe 'highlight jsonBoolean gui=NONE guifg=' . bright_red

" syntax typescript
exe 'highlight typescriptBoolean gui=NONE guifg=' . bright_red
exe 'highlight typescriptParens gui=NONE guifg=' . pure_white

" syntax python
exe 'highlight pythonBuiltin gui=NONE guifg=' . bright_red
exe 'highlight pythonConditional gui=NONE guifg=' . bright_red
exe 'highlight pythonException gui=NONE guifg=' . bright_red
exe 'highlight pythonExceptions gui=NONE guifg=' . bright_red

" syntax sql
exe 'highlight sqlKeyword gui=NONE guifg=' . bright_red
exe 'highlight sqlSpecial gui=NONE guifg=' . bright_red


" unknown usage, setting to magenta as a canary
exe 'highlight FoldColumn gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpellCap gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpellLocal gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpellBad gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight PMenuThumb gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta

"hi clear -- no settings --
"hi Ignore -- no settings --
"hi EnumerationName -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi Question -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi CTagsClass -- no settings --

