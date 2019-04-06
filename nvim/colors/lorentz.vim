set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

set t_Co=256
let g:colors_name = "lorentz"

" TODO: add terminal colors
" TODO: fix json colors - may require plugin

"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#cccccc guibg=#101010
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
hi IncSearch guifg=#192224 guibg=#BD9800
hi WildMenu guifg=NONE guibg=#A1A6A8
hi SignColumn guifg=#192224 guibg=#536991
hi SpecialComment guifg=#BD9800 guibg=NONE
hi Typedef guifg=#536991 guibg=NONE
hi Title guifg=#cccccc guibg=#192224
hi PreCondit guifg=#d60010 guibg=NONE
hi Include guifg=#BD9800 guibg=NONE
hi TabLineSel guifg=#f39645 guibg=#101010
hi StatusLineNC guifg=#808080 guibg=#000000
hi NonText guifg=#5E6C70 guibg=NONE
hi DiffText guifg=NONE guibg=#00b7ff
hi ErrorMsg guifg=#101010 guibg=#b1a500
hi Debug guifg=#BD9800 guibg=NONE
hi PMenuSbar guifg=NONE guibg=#848688
hi Identifier guifg=#cccccc guibg=NONE
hi SpecialChar guifg=#BD9800 guibg=NONE
hi Conditional guifg=#d60010 guibg=NONE
hi StorageClass guifg=#cccccc guibg=NONE
hi Todo guifg=#101010 guibg=#b1a500
hi Special guifg=#ffffff guibg=NONE
hi LineNr guifg=#808080 guibg=#000000
hi StatusLine guifg=#f39645 guibg=#000000
hi Label guifg=#BD9800 guibg=NONE
hi PMenuSel guifg=#f39645 guibg=#101010
hi Search guifg=#192224 guibg=#BD9800
hi Delimiter guifg=#BD9800 guibg=NONE
hi Statement guifg=#d60010 guibg=NONE
hi SpellRare guifg=#F9F9FF guibg=#192224
hi Comment guifg=#808080 guibg=NONE gui=italic
hi Character guifg=#A1A6A8 guibg=NONE
hi Float guifg=#A1A6A8 guibg=NONE
hi Number guifg=#bb83d1 guibg=NONE
hi Boolean guifg=#A1A6A8 guibg=NONE
hi Operator guifg=#d60010 guibg=NONE
hi CursorLine guifg=NONE guibg=#000000
hi CursorLineNR guifg=#f39645 guibg=#000000
hi TabLineFill guifg=#101010 guibg=#808080
hi WarningMsg guifg=#A1A6A8 guibg=#912C00
hi VisualNOS guifg=#192224 guibg=#F9F9FF
hi DiffDelete guifg=#cccccc guibg=#5b1b1b
hi ModeMsg guifg=#F9F9F9 guibg=#192224
hi CursorColumn guifg=NONE guibg=#222E30
hi Define guifg=#BD9800 guibg=NONE
hi Function guifg=#cccccc guibg=NONE
hi FoldColumn guifg=#192224 guibg=#A1A6A8
hi PreProc guifg=#d60010 guibg=NONE
hi Visual guifg=#192224 guibg=#BBBBBB
hi MoreMsg guifg=#BD9800 guibg=NONE
hi SpellCap guifg=#F9F9FF guibg=#192224
hi VertSplit guifg=#192224 guibg=#5E6C70
hi Exception guifg=#BD9800 guibg=NONE
hi Keyword guifg=#d60010 guibg=NONE
hi Type guifg=#d60010 guibg=NONE
hi DiffChange guifg=#cccccc guibg=#43698d
hi Cursor guifg=#101010 guibg=#bbbbbb
hi SpellLocal guifg=#F9F9FF guibg=#192224
hi Error guifg=#A1A6A8 guibg=#912C00
hi PMenu guifg=#101010 guibg=#808080
hi SpecialKey guifg=#5E6C70 guibg=NONE
hi Constant guifg=#d4000e guibg=NONE
hi Tag guifg=#BD9800 guibg=NONE
hi String guifg=#f39645 guibg=NONE
hi PMenuThumb guifg=NONE guibg=#a4a6a8
hi MatchParen guifg=#BD9800 guibg=NONE
hi Repeat guifg=#d60010 guibg=NONE
hi SpellBad guifg=#F9F9FF guibg=#192224
hi Directory guifg=#536991 guibg=NONE
hi Structure guifg=#536991 guibg=NONE
hi Macro guifg=#BD9800 guibg=NONE
hi Underlined guifg=#F9F9FF guibg=#192224
hi DiffAdd guifg=#cccccc guibg=#447152
hi TabLine guifg=#101010 guibg=#808080
hi cursorim guifg=#192224 guibg=#536991

" keywords
" keywords java
hi javaExternal guifg=#d60010 guibg=NONE
hi javaStorageClass guifg=#d60010 guibg=NONE
hi javaScopeDecl guifg=#d60010 guibg=NONE
hi javaTypedef guifg=#d60010 guibg=NONE

" xml
hi xmlTagName guifg=#d60010 guibg=NONE
hi xmlAttrib guifg=#cccccc guibg=NONE

