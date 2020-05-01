set background=light
hi clear
if exists("syntax_on")
	syntax reset
endif

" this theme really only works with true color terminals
set t_Co=256
let g:colors_name = "narcissus"

let testMagenta = '#ff00ff'

let middle_grey_bg = '#999999'
let slate_grey_fg = '#303030'
let dull_black_0 = '#606060'
let bright_black_8 = '#010101' " hacky workaround for #000000 not working in some guis
let dull_red_1 = '#700000'
let bright_red_9 = '#c2000f'
let dull_green_2 = '#164f27'
let bright_green_10 = '#62ffc3'
let dull_yellow_3 = '#5b5500'
let bright_yellow_11 = '#f4e41f'
let dull_blue_4 = '#43698d'
let bright_blue_12 = '#60c0ff'
let dull_orange_5 = '#a05614'
let bright_orange_13 = '#fe9131'
let dull_purple_6 = '#6a2071'
let bright_purple_14 = '#b000f7'
let dull_white_7 = '#bbbbbb'
let bright_white_15 = '#eeeeee'

" terminal colors
let g:terminal_color_0 = dull_black_0
let g:terminal_color_1 = dull_red_1
let g:terminal_color_2 = dull_green_2
let g:terminal_color_3 = dull_yellow_3
let g:terminal_color_4 = dull_blue_4
let g:terminal_color_5 = dull_orange_5
let g:terminal_color_6 = dull_purple_6
let g:terminal_color_7 = dull_white_7
let g:terminal_color_8 = bright_black_8
let g:terminal_color_9 = bright_red_9
let g:terminal_color_10 = bright_green_10
let g:terminal_color_11 = bright_yellow_11
let g:terminal_color_12 = bright_blue_12
let g:terminal_color_13 = bright_orange_13
let g:terminal_color_14 = bright_purple_14
let g:terminal_color_15 = bright_white_15

" editor interface colors
exe 'highlight Cursor gui=NONE guifg=' . middle_grey_bg 'guibg=' . slate_grey_fg
exe 'highlight Normal gui=NONE guifg=' . slate_grey_fg 'guibg=' . middle_grey_bg
exe 'highlight Visual gui=NONE guifg=' . dull_white_7 'guibg=' . dull_black_0
exe 'highlight VisualNOS gui=NONE guifg=' . dull_white_7 'guibg=' . dull_black_0
exe 'highlight WildMenu gui=NONE guifg=' . dull_orange_5 'guibg=' . dull_black_0
exe 'highlight NonText gui=italic guifg=' . dull_black_0
exe 'highlight ErrorMsg gui=NONE guifg=' . dull_white_7 'guibg=' . dull_yellow_3
exe 'highlight LineNr gui=NONE guifg=' . dull_white_7 'guibg=' . dull_black_0
exe 'highlight CursorLineNR gui=NONE guifg=' . dull_red_1 'guibg=' . dull_black_0
exe 'highlight WarningMsg gui=italic guifg=' . dull_yellow_3
exe 'highlight ModeMsg gui=NONE guifg=' . bright_white_15 'guibg=' . bright_red_9
exe 'highlight MoreMsg gui=NONE guifg=' . bright_black_8
exe 'highlight VertSplit gui=NONE guifg=' . dull_black_0 'guibg=' . dull_black_0
exe 'highlight Directory gui=bold guifg=' . bright_blue_12
exe 'highlight TabLine gui=NONE guifg=' . bright_white_15 'guibg=' . dull_black_0
exe 'highlight TabLineSel gui=NONE guifg=' . dull_red_1 'guibg=' . middle_grey_bg
exe 'highlight TabLineFill gui=NONE guibg=' . dull_black_0
exe 'highlight StatusLine gui=NONE guifg=' . dull_red_1 'guibg=' . dull_black_0
exe 'highlight StatusLineNC gui=NONE guifg=' . dull_white_7 'guibg=' . dull_black_0
exe 'highlight StatusLineFlag gui=bold guifg=' . dull_purple_6 'guibg=' . dull_black_0
exe 'highlight StatusLineModified gui=bold guifg=' . dull_green_2 'guibg=' . dull_black_0
exe 'highlight PMenu gui=NONE guifg=' . slate_grey_fg 'guibg=' . dull_black_0
exe 'highlight PMenuSel gui=NONE guifg=' . dull_red_1 'guibg=' . dull_black_0
exe 'highlight PMenuSbar gui=NONE guibg=' . bright_white_15

" editor contextual colors
exe 'highlight CursorLine guibg=' . dull_white_7
exe 'highlight Search gui=NONE guifg=' . slate_grey_fg 'guibg=' . bright_blue_12
exe 'highlight IncSearch gui=NONE guifg=' . slate_grey_fg 'guibg=' . bright_blue_12
exe 'highlight MatchParen gui=bold guifg=' . slate_grey_fg 'guibg=' . bright_blue_12

" diff colors
exe 'highlight DiffChange gui=NONE guifg=' . bright_white_15 'guibg=' . dull_blue_4
exe 'highlight DiffText gui=NONE guifg=' . bright_white_15 'guibg=' . bright_blue_12
exe 'highlight DiffDelete gui=NONE guifg=' . bright_white_15 'guibg=' . dull_red_1
exe 'highlight diffRemoved gui=NONE guifg=' . bright_white_15 'guibg=' . dull_red_1
exe 'highlight DiffAdd gui=NONE guifg=' . bright_white_15 'guibg=' . dull_green_2
exe 'highlight diffAdded gui=NONE guifg=' . bright_white_15 'guibg=' . dull_green_2
exe 'highlight diffFile gui=NONE guifg=' . dull_orange_5
exe 'highlight diffLine gui=NONE guifg=' . bright_black_8
exe 'highlight diffIndexLine gui=NONE guifg=' . bright_black_8

" syntax colors
exe 'highlight Underlined gui=underline guifg=' . slate_grey_fg
exe 'highlight Title gui=underline guifg=' . bright_black_8
exe 'highlight Comment gui=italic guifg=' . bright_white_15
exe 'highlight Typedef gui=NONE guifg=' . dull_red_1
exe 'highlight String gui=NONE guifg=' . dull_orange_5
exe 'highlight PreCondit gui=NONE guifg=' . dull_red_1
exe 'highlight Debug gui=NONE guifg=' . bright_yellow_11
exe 'highlight Conditional gui=NONE guifg=' . dull_red_1
exe 'highlight Special gui=NONE guifg=' . bright_black_8
exe 'highlight SpecialChar gui=NONE guifg=' . bright_black_8
exe 'highlight Delimiter gui=NONE guifg=' . bright_black_8
exe 'highlight StorageClass gui=NONE guifg=' . dull_red_1
exe 'highlight Exception gui=NONE guifg=' . dull_red_1
exe 'highlight Function gui=NONE guifg=' . slate_grey_fg
exe 'highlight Label gui=NONE guifg=' . dull_red_1
exe 'highlight Keyword gui=NONE guifg=' . dull_red_1
exe 'highlight Constant gui=NONE guifg=' . dull_red_1
exe 'highlight Repeat gui=NONE guifg=' . dull_red_1
exe 'highlight Type gui=NONE guifg=' . dull_red_1
exe 'highlight Identifier gui=NONE guifg=' . slate_grey_fg
exe 'highlight Statement gui=NONE guifg=' . dull_red_1
exe 'highlight Operator gui=NONE guifg=' . dull_red_1
exe 'highlight Character gui=NONE guifg=' . dull_purple_6
exe 'highlight Float gui=NONE guifg=' . dull_purple_6
exe 'highlight Number gui=NONE guifg=' . dull_purple_6
exe 'highlight Boolean gui=NONE guifg=' . dull_purple_6
exe 'highlight Macro gui=NONE guifg=' . dull_green_2
exe 'highlight PreProc gui=NONE guifg=' . dull_green_2
exe 'highlight PreCondit gui=NONE guifg=' . dull_green_2
exe 'highlight Define gui=NONE guifg=' . dull_green_2
exe 'highlight Include gui=NONE guifg=' . dull_green_2
exe 'highlight Tag gui=underline'
exe 'highlight Todo gui=NONE guifg=' . bright_yellow_11 'guibg=' . bright_black_8
exe 'highlight Error gui=NONE guifg=' . dull_white_7 'guibg=' . dull_yellow_3
exe 'highlight Whitespace gui=italic guifg=' . bright_white_15
exe 'highlight NonText gui=italic guifg=' . bright_white_15

" syntax vim
exe 'highlight vimCommand gui=NONE guifg=' . dull_red_1 'guibg=NONE'
exe 'highlight vimExecute gui=NONE guifg=' . dull_red_1 'guibg=NONE'
exe 'highlight vimHighlight gui=NONE guifg=' . dull_red_1 'guibg=NONE'
exe 'highlight vimOption gui=NONE guifg=' . dull_red_1 'guibg=NONE'

" syntax shell
exe 'highlight shQuote gui=NONE guifg=' . dull_orange_5 'guibg=NONE'
exe 'highlight shDeref gui=NONE guifg=' . bright_black_8 'guibg=NONE'

" syntax git
exe 'highlight gitcommitSummary gui=underline guifg=' . slate_grey_fg 'guibg=NONE'
exe 'highlight gitcommitOverflow gui=NONE guifg=' . dull_yellow_3 'guibg=NONE'
exe 'highlight gitcommitBlank gui=NONE guifg=' . slate_grey_fg 'guibg=' . bright_yellow_11
exe 'highlight gitcommitBranch gui=NONE guifg=' . slate_grey_fg 'guibg=' . dull_orange_5
exe 'highlight gitcommitHeader gui=NONE guifg=' . bright_white_15 'guibg=NONE'
exe 'highlight gitrebaseCommit gui=NONE guifg=' . dull_blue_4 'guibg=NONE'
exe 'highlight gitrebaseHash gui=NONE guifg=' . dull_blue_4 'guibg=NONE'
exe 'highlight gitrebaseSummary gui=NONE guifg=' . slate_grey_fg 'guibg=NONE'

" syntax java
exe 'highlight javaExternal gui=NONE guifg=' . dull_red_1
exe 'highlight javaStorageClass gui=NONE guifg=' . dull_red_1
exe 'highlight javaScopeDecl gui=NONE guifg=' . dull_red_1
exe 'highlight javaTypedef gui=NONE guifg=' . dull_red_1
exe 'highlight javaBoolean gui=NONE guifg=' . dull_red_1
exe 'highlight javaConditional gui=NONE guifg=' . dull_red_1
exe 'highlight javaExceptions gui=NONE guifg=' . dull_red_1
exe 'highlight javaCommentTitle gui=italic guifg=' . bright_white_15

" syntax xml
exe 'highlight xmlTagName gui=NONE guifg=' . dull_red_1
exe 'highlight xmlAttrib gui=NONE guifg=' . slate_grey_fg

" syntax javascript
exe 'highlight javaScriptException gui=NONE guifg=' . dull_red_1
exe 'highlight javaScriptIdentifier gui=NONE guifg=' . dull_red_1
exe 'highlight javaScriptConditional gui=NONE guifg=' . dull_red_1
exe 'highlight javaScriptBoolean gui=NONE guifg=' . dull_red_1
exe 'highlight javaScriptNumber gui=NONE guifg=' . dull_purple_6

" syntax json
" TODO: do something about json errors (there are a lot of varieties)
exe 'highlight jsonKeyword gui=NONE guifg=' . slate_grey_fg
exe 'highlight jsonBoolean gui=NONE guifg=' . dull_red_1

" syntax typescript
exe 'highlight typescriptBoolean gui=NONE guifg=' . dull_red_1
exe 'highlight typescriptParens gui=NONE guifg=' . bright_black_8

" syntax python
exe 'highlight pythonBuiltin gui=NONE guifg=' . dull_red_1
exe 'highlight pythonInclude gui=NONE guifg=' . dull_red_1
exe 'highlight pythonException gui=NONE guifg=' . dull_red_1
exe 'highlight pythonExceptions gui=NONE guifg=' . dull_red_1

" syntax sql
exe 'highlight sqlKeyword gui=NONE guifg=' . dull_red_1
exe 'highlight sqlSpecial gui=NONE guifg=' . dull_red_1

" unknown usage, setting to magenta as a canary
exe 'highlight FoldColumn gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpellCap gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpellLocal gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpellBad gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpecialKey gui=italic guifg=' . bright_black_8
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
