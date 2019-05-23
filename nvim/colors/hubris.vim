set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

set t_Co=256
let g:colors_name = "hubris"

let testMagenta = '#ff00ff'

let dark_grey = '#101010'
let dull_red = '#5b1b1b'
let dull_green = '#447152'
let dull_yellow = '#413c00'
let dull_blue = '#43698d'
let orange = '#f39745'
let purple = '#bb83d1'
let off_white = '#cccccc'
let mid_grey = '#808080'
let bright_red = '#d60010'
let bright_green = '#6fdbb2'
let bright_yellow = '#b1a400'
let bright_blue = '#00b8ff'
let pure_white = '#ffffff'
let pure_black = '#010101' " hacky workaround for black not working in some guis

" editor interface colors
exe 'highlight Cursor gui=NONE guifg=' . dark_grey 'guibg=' . off_white
exe 'highlight Normal gui=NONE guifg=' . off_white 'guibg=' . dark_grey
exe 'highlight Visual gui=NONE guifg=' . off_white 'guibg=' . mid_grey
exe 'highlight VisualNOS gui=NONE guifg=' . off_white 'guibg=' . mid_grey
exe 'highlight WildMenu gui=NONE guifg=' . dark_grey 'guibg=' . orange
exe 'highlight Title gui=NONE guifg=' . dark_grey 'guibg=' . mid_grey
exe 'highlight StatusLine gui=NONE guifg=' . orange 'guibg=' . pure_black
exe 'highlight StatusLineNC gui=NONE guifg=' . mid_grey 'guibg=' . pure_black
exe 'highlight NonText gui=italic guifg=' . mid_grey
exe 'highlight ErrorMsg gui=NONE guifg=' . dark_grey 'guibg=' . bright_yellow
exe 'highlight LineNr gui=NONE guifg=' . mid_grey 'guibg=' . pure_black
exe 'highlight CursorLineNR gui=NONE guifg=' . orange 'guibg=' . pure_black
exe 'highlight PMenuSel gui=NONE guifg=' . dark_grey 'guibg=' . mid_grey
exe 'highlight PMenuSbar gui=NONE guibg=' . off_white
exe 'highlight TabLine gui=NONE guifg=' . off_white 'guibg=' . pure_black
exe 'highlight TabLineSel gui=NONE guifg=' . orange 'guibg=' . dark_grey
exe 'highlight TabLineFill gui=NONE guibg=' . pure_black
exe 'highlight WarningMsg gui=italic guifg=' . bright_yellow
exe 'highlight ModeMsg gui=NONE guifg=' . dark_grey 'guibg=' . orange
exe 'highlight VertSplit gui=NONE guifg=' . mid_grey 'guibg=' . pure_black
exe 'highlight Directory gui=bold guifg=' . bright_blue

" editor contextual colors
exe 'highlight CursorLine guibg=' . pure_black
exe 'highlight Search gui=NONE guifg=' . dark_grey 'guibg=' . bright_blue
exe 'highlight IncSearch gui=NONE guifg=' . dark_grey 'guibg=' . bright_blue
exe 'highlight MatchParen gui=bold guifg=' . dark_grey 'guibg=' . bright_blue

" diff colors
exe 'highlight DiffChange gui=NONE guifg=' . off_white 'guibg=' . dull_blue
exe 'highlight DiffText gui=NONE guifg=' . dark_grey 'guibg=' . bright_blue
exe 'highlight DiffDelete gui=NONE guifg=' . off_white 'guibg=' . dull_red
exe 'highlight DiffAdd gui=NONE guifg=' . off_white 'guibg=' . dull_green

" syntax colors
exe 'highlight Comment gui=italic guifg=' . mid_grey
exe 'highlight Typedef gui=NONE guifg=' . bright_red
exe 'highlight String gui=NONE guifg=' . orange
exe 'highlight PreCondit gui=NONE guifg=' . bright_red
exe 'highlight Include gui=NONE guifg=' . bright_red
exe 'highlight Debug gui=NONE guifg=' . bright_yellow
exe 'highlight Conditional gui=NONE guifg=' . off_white
exe 'highlight Special gui=NONE guifg=' . pure_white
exe 'highlight SpecialChar gui=NONE guifg=' . pure_white
exe 'highlight Delimiter gui=NONE guifg=' . pure_white
exe 'highlight StorageClass gui=NONE guifg=' . off_white
exe 'highlight Function gui=NONE guifg=' . off_white
exe 'highlight Todo gui=NONE guifg=' . dark_grey 'guibg=' . bright_yellow
exe 'highlight Label gui=NONE guifg=' . bright_red
exe 'highlight Keyword gui=NONE guifg=' . bright_red
exe 'highlight Type gui=NONE guifg=' . bright_red
exe 'highlight Identifier gui=NONE guifg=' . off_white
exe 'highlight Statement gui=NONE guifg=' . bright_red
exe 'highlight Operator gui=NONE guifg=' . bright_red
exe 'highlight Define gui=NONE guifg=' . bright_red
exe 'highlight Character gui=NONE guifg=' . purple
exe 'highlight Float gui=NONE guifg=' . purple
exe 'highlight Number gui=NONE guifg=' . purple
exe 'highlight Boolean gui=NONE guifg=' . purple

" syntax vim
exe 'highlight vimCommand gui=NONE guifg=' . bright_red 'guibg=NONE'
exe 'highlight vimExecute gui=NONE guifg=' . bright_red 'guibg=NONE'
exe 'highlight vimHighlight gui=NONE guifg=' . bright_red 'guibg=NONE'

" syntax git
exe 'highlight gitcommitSummary gui=NONE guifg=' . orange 'guibg=NONE'
exe 'highlight gitcommitOverflow gui=NONE guifg=' . bright_yellow 'guibg=NONE'
exe 'highlight gitcommitBlank gui=NONE guifg=' . dark_grey 'guibg=' . bright_yellow
exe 'highlight gitcommitBranch gui=NONE guifg=' . dark_grey 'guibg=' . orange
exe 'highlight gitcommitHeader gui=NONE guifg=' . pure_white 'guibg=NONE'
exe 'highlight gitrebaseCommit gui=NONE guifg=' . bright_blue 'guibg=NONE'
exe 'highlight gitrebaseHash gui=NONE guifg=' . bright_blue 'guibg=NONE'

" syntax java
exe 'highlight javaExternal gui=NONE guifg=' . bright_red
exe 'highlight javaStorageClass gui=NONE guifg=' . bright_red
exe 'highlight javaScopeDecl gui=NONE guifg=' . bright_red
exe 'highlight javaTypedef gui=NONE guifg=' . bright_red
exe 'highlight javaBoolean gui=NONE guifg=' . bright_red
exe 'highlight javaConditional gui=NONE guifg=' . bright_red
exe 'highlight javaExceptions gui=NONE guifg=' . bright_red

" syntax xml
exe 'highlight xmlTagName gui=NONE guifg=' . bright_red
exe 'highlight xmlAttrib gui=NONE guifg=' . off_white

" syntax javascript
exe 'highlight javaScriptException gui=NONE guifg=' . bright_red

" syntax json
" TODO: do something about json errors (there are a lot of varieties)
exe 'highlight jsonKeyword gui=NONE guifg=' . off_white
exe 'highlight jsonBoolean gui=NONE guifg=' . bright_red

" syntax typescript
exe 'highlight typescriptBoolean gui=NONE guifg=' . bright_red
exe 'highlight typescriptParens gui=NONE guifg=' . pure_white

" syntax sql
exe 'highlight sqlKeyword gui=NONE guifg=' . bright_red
exe 'highlight sqlSpecial gui=NONE guifg=' . bright_red

" terminal colors
let g:terminal_color_0 = dark_grey
let g:terminal_color_1 = dull_red
let g:terminal_color_2 = dull_green
let g:terminal_color_3 = dull_yellow
let g:terminal_color_4 = dull_blue
let g:terminal_color_5 = orange
let g:terminal_color_6 = purple
let g:terminal_color_7 = off_white
let g:terminal_color_8 = mid_grey
let g:terminal_color_9 = bright_red
let g:terminal_color_10 = bright_green
let g:terminal_color_11 = bright_yellow
let g:terminal_color_12 = bright_blue
let g:terminal_color_13 = orange
let g:terminal_color_14 = purple
let g:terminal_color_15 = pure_white

" TODO: migrate the rest of these to the new style
hi FoldColumn guifg=#192224 guibg=#A1A6A8 gui=NONE
hi PreProc guifg=#d60010 guibg=NONE gui=NONE
hi MoreMsg guifg=#BD9800 guibg=NONE gui=NONE
hi SpellCap guifg=#F9F9FF guibg=#192224 gui=NONE
hi Exception guifg=#BD9800 guibg=NONE gui=NONE
hi SpellLocal guifg=#F9F9FF guibg=#192224 gui=NONE
hi Error guifg=#A1A6A8 guibg=#912C00 gui=NONE
hi PMenu guifg=#101010 guibg=#808080 gui=NONE
hi SpecialKey guifg=#5E6C70 guibg=NONE gui=NONE
hi Constant guifg=#d4000e guibg=NONE gui=NONE
hi Tag guifg=#BD9800 guibg=NONE gui=NONE
hi PMenuThumb guifg=NONE guibg=#a4a6a8 gui=NONE
hi Repeat guifg=#d60010 guibg=NONE gui=NONE
hi SpellBad guifg=#F9F9FF guibg=#192224 gui=NONE
hi Structure guifg=#536991 guibg=NONE gui=NONE
hi Macro guifg=#BD9800 guibg=NONE gui=NONE
hi Underlined guifg=#F9F9FF guibg=#192224 gui=NONE

"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi Question -- no settings --
"hi EnumerationName -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi CTagsClass -- no settings --
"hi clear -- no settings --
