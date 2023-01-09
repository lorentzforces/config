set background=light
hi clear
if exists("syntax_on")
	syntax reset
endif

" this theme really only works with true color terminals
set t_Co=256
let g:colors_name = "narcissus"

" TODO: all these variables for colors are leaked, maybe do something about that
let testMagenta = '#ff00ff'

let middle_grey = '#999999' " background
let slate_grey = '#303030' " foreground
let dull_black = '#606060'
let bright_black = '#010101' " hacky workaround for #000000 not working in some guis
let dull_red = '#700000'
let bright_red = '#c2000f'
let dull_green = '#164f27'
let bright_green = '#62ffc3'
let dull_yellow = '#5b5500'
let bright_yellow = '#f4e41f'
let dull_blue = '#43698d'
let bright_blue = '#60c0ff'
let dull_orange = '#a05614'
let bright_orange = '#fe9131'
let dull_purple = '#6a2071'
let bright_purple = '#b000f7'
let dull_white = '#bbbbbb'
let bright_white = '#eeeeee'

" terminal colors
let g:terminal_color_0 = dull_black
let g:terminal_color_1 = dull_red
let g:terminal_color_2 = dull_green
let g:terminal_color_3 = dull_yellow
let g:terminal_color_4 = dull_blue
let g:terminal_color_5 = dull_orange
let g:terminal_color_6 = dull_purple
let g:terminal_color_7 = dull_white
let g:terminal_color_8 = bright_black
let g:terminal_color_9 = bright_red
let g:terminal_color_10 = bright_green
let g:terminal_color_11 = bright_yellow
let g:terminal_color_12 = bright_blue
let g:terminal_color_13 = bright_orange
let g:terminal_color_14 = bright_purple
let g:terminal_color_15 = bright_white

" editor interface colors
exe 'highlight Cursor gui=NONE guifg=' . middle_grey 'guibg=' . slate_grey
exe 'highlight Normal gui=NONE guifg=' . slate_grey 'guibg=' . middle_grey
exe 'highlight Visual gui=NONE guifg=' . dull_white 'guibg=' . dull_black
exe 'highlight VisualNOS gui=NONE guifg=' . dull_white 'guibg=' . dull_black
exe 'highlight WildMenu gui=NONE guifg=' . dull_orange 'guibg=' . dull_black
exe 'highlight NonText gui=italic guifg=' . dull_black
exe 'highlight ErrorMsg gui=NONE guifg=' . dull_white 'guibg=' . dull_yellow
exe 'highlight LineNr gui=NONE guifg=' . dull_white 'guibg=' . dull_black
exe 'highlight CursorLineNR gui=NONE guifg=' . dull_red 'guibg=' . dull_black
exe 'highlight WarningMsg gui=italic guifg=' . dull_yellow
exe 'highlight ModeMsg gui=NONE guifg=' . bright_white 'guibg=' . dull_red
exe 'highlight MoreMsg gui=NONE guifg=' . bright_black
exe 'highlight VertSplit gui=NONE guifg=' . middle_grey 'guibg=' . middle_grey
exe 'highlight Directory gui=bold guifg=' . bright_blue
exe 'highlight SpecialKey gui=italic guifg=' . bright_black
exe 'highlight TabLine gui=NONE guifg=' . bright_white 'guibg=' . dull_black
exe 'highlight TabLineSel gui=NONE guifg=' . dull_red 'guibg=' . middle_grey
exe 'highlight TabLineFill gui=NONE guibg=' . dull_black
exe 'highlight StatusLine gui=NONE guifg=' . dull_white 'guibg=' . dull_red
exe 'highlight StatusLineNC gui=NONE guifg=' . dull_white 'guibg=' . dull_black
exe 'highlight StatusLineFlag gui=bold guifg=' . dull_white 'guibg=' . dull_red
exe 'highlight StatusLineModified gui=bold guifg=' . dull_white 'guibg=' . dull_red
exe 'highlight PMenu gui=NONE guifg=' . slate_grey 'guibg=' . dull_white
exe 'highlight PmenuSel gui=NONE guifg=' . dull_red 'guibg=' . dull_white
exe 'highlight PmenuSbar gui=NONE guibg=' . dull_white
exe 'highlight PmenuThumb gui=NONE guibg=' . dull_black
exe 'highlight SignColumn gui=NONE guifg=' . slate_grey 'guibg=' . middle_grey
exe 'highlight netrwDir gui=NONE guifg=' . dull_orange
exe 'highlight ColorColumn gui=NONE guibg=' . dull_white

" editor contextual colors
exe 'highlight CursorLine guibg=' . dull_white
exe 'highlight Search gui=NONE guifg=' . slate_grey 'guibg=' . bright_blue
exe 'highlight IncSearch gui=NONE guifg=' . slate_grey 'guibg=' . bright_blue
exe 'highlight MatchParen gui=bold guifg=' . slate_grey 'guibg=' . bright_blue

" diff colors
exe 'highlight DiffChange gui=NONE guifg=' . bright_white 'guibg=' . dull_blue
exe 'highlight DiffText gui=NONE guifg=' . bright_white 'guibg=' . bright_blue
exe 'highlight DiffDelete gui=NONE guifg=' . bright_white 'guibg=' . dull_red
exe 'highlight diffRemoved gui=NONE guifg=' . bright_white 'guibg=' . dull_red
exe 'highlight DiffAdd gui=NONE guifg=' . bright_white 'guibg=' . dull_green
exe 'highlight diffAdded gui=NONE guifg=' . bright_white 'guibg=' . dull_green
exe 'highlight diffFile gui=NONE guifg=' . dull_orange
exe 'highlight diffLine gui=NONE guifg=' . bright_black
exe 'highlight diffIndexLine gui=NONE guifg=' . bright_black

" syntax colors
exe 'highlight Underlined gui=underline guifg=' . slate_grey
exe 'highlight Title gui=underline guifg=' . bright_black
exe 'highlight Comment gui=italic guifg=' . bright_white
exe 'highlight Typedef gui=NONE guifg=' . dull_red
exe 'highlight Debug gui=NONE guifg=' . bright_yellow
exe 'highlight Conditional gui=NONE guifg=' . dull_red
exe 'highlight Special gui=NONE guifg=' . bright_black
exe 'highlight SpecialChar gui=NONE guifg=' . bright_white
exe 'highlight Delimiter gui=NONE guifg=' . slate_grey
exe 'highlight StorageClass gui=NONE guifg=' . dull_red
exe 'highlight Exception gui=NONE guifg=' . dull_red
exe 'highlight Function gui=NONE guifg=' . slate_grey
exe 'highlight Label gui=NONE guifg=' . dull_green
exe 'highlight Keyword gui=NONE guifg=' . dull_red
exe 'highlight Constant gui=NONE guifg=' . slate_grey
exe 'highlight Repeat gui=NONE guifg=' . dull_red
exe 'highlight Type gui=NONE guifg=' . slate_grey
exe 'highlight Identifier gui=NONE guifg=' . slate_grey
exe 'highlight Statement gui=NONE guifg=' . dull_red
exe 'highlight Operator gui=NONE guifg=' . dull_red
exe 'highlight String gui=NONE guifg=' . dull_orange
exe 'highlight Character gui=NONE guifg=' . dull_purple
exe 'highlight Float gui=NONE guifg=' . dull_purple
exe 'highlight Number gui=NONE guifg=' . dull_purple
exe 'highlight Boolean gui=NONE guifg=' . dull_purple
exe 'highlight Macro gui=NONE guifg=' . dull_purple
exe 'highlight PreProc gui=NONE guifg=' . dull_purple
exe 'highlight PreCondit gui=NONE guifg=' . dull_purple
exe 'highlight Define gui=NONE guifg=' . dull_purple
exe 'highlight Include gui=NONE guifg=' . dull_purple
" exe 'highlight Tag gui=underline'
exe 'highlight Tag gui=NONE guifg=' . dull_red
exe 'highlight Todo gui=NONE guifg=' . bright_yellow 'guibg=' . bright_black
exe 'highlight Error gui=NONE guifg=' . dull_white 'guibg=' . dull_yellow
exe 'highlight Whitespace gui=italic guifg=' . bright_white
exe 'highlight NonText gui=italic guifg=' . bright_white
exe 'highlight helpHeader gui=NONE guifg=' . dull_red

" treesitter
" some common ones that really should just be the base group regardless of
" language, but I can't highlight, for example, "@type.builtin" versus "type"
" the following does not work (output of :hi shows the correct color, but the
" actual text is not highlighted the specified color)
" highlight link @type.builtin NONE
" exe 'highlight @type.builtin gui=NONE guifg=' . dull_red

exe 'highlight @constructor gui=NONE guifg=' . slate_grey

" treesitter java
exe 'highlight @constant.builtin.java gui=NONE guifg=' . dull_red
exe 'highlight @type.builtin.java gui=NONE guifg=' . dull_red

" treesitter rust
exe 'highlight @variable.builtin.rust gui=NONE guifg=' . dull_red
exe 'highlight @constant.builtin.rust gui=NONE guifg=' . dull_red

" treesitter json
exe 'highlight @label.json gui=NONE guifg=' . slate_grey

" treesitter html
exe 'highlight @tag.attribute gui=NONE guifg=' . slate_grey

" syntax git
exe 'highlight gitcommitSummary gui=NONE guifg=' . dull_red 'guibg=NONE'
exe 'highlight gitcommitOverflow gui=NONE guifg=' . dull_yellow 'guibg=NONE'
exe 'highlight gitcommitBlank gui=NONE guifg=' . slate_grey 'guibg=' . bright_yellow
exe 'highlight gitcommitBranch gui=NONE guifg=' . bright_white 'guibg=' . dull_red
exe 'highlight gitcommitHeader gui=NONE guifg=' . bright_white 'guibg=NONE'
exe 'highlight gitrebaseCommit gui=NONE guifg=' . dull_blue 'guibg=NONE'
exe 'highlight gitrebaseHash gui=NONE guifg=' . dull_blue 'guibg=NONE'
exe 'highlight gitrebaseSummary gui=NONE guifg=' . slate_grey 'guibg=NONE'

" plugin-specific highlighting for vim-gitgutter
exe 'highlight GitGutterAdd gui=bold guifg=' . dull_green
exe 'highlight GitGutterChange gui=bold guifg=' . dull_blue
exe 'highlight GitGutterChangeDelete gui=bold guifg=' . dull_blue
exe 'highlight GitGutterDelete gui=bold guifg=' . dull_red

" unknown usage, setting to magenta as a canary
exe 'highlight FoldColumn gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpellCap gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpellLocal gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta
exe 'highlight SpellBad gui=NONE guifg=' . testMagenta 'guibg=' . testMagenta

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
