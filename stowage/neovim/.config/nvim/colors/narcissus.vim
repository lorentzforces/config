set background=light
hi clear
if exists("syntax_on")
	syntax reset
endif

" this theme really only works with true color terminals
set t_Co=256
let g:colors_name = "narcissus"

" TODO: all these variables for colors are leaked, maybe do something about that
let TEST_MAGENTA = '#ff00ff'

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
exe 'highlight LineNr gui=NONE guifg=' . dull_white 'guibg=NONE'
exe 'highlight CursorLineNr gui=NONE guifg=' . dull_red
exe 'highlight WarningMsg gui=italic guifg=' . dull_yellow
exe 'highlight ModeMsg gui=NONE guifg=' . bright_white 'guibg=' . dull_red
exe 'highlight MoreMsg gui=NONE guifg=' . bright_black
exe 'highlight VertSplit gui=NONE guifg=' . middle_grey 'guibg=NONE'
exe 'highlight WinSeparator gui=NONE guifg=background guibg=NONE'
exe 'highlight Directory gui=bold guifg=' . dull_red
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
exe 'highlight SignColumn gui=NONE guifg=' . slate_grey 'guibg=NONE'
exe 'highlight FoldColumn gui=NONE guifg=' . slate_grey 'guibg=NONE'
exe 'highlight netrwDir gui=NONE guifg=' . dull_orange
exe 'highlight ColorColumn gui=NONE guibg=' . dull_white
exe 'highlight QuickFixLine gui=NONE guibg=' . dull_white
exe 'highlight qfLineNr gui=NONE guifg=' . dull_green
exe 'highlight Question gui=bold guifg=' . dull_red

" editor contextual colors
exe 'highlight CursorLine guibg=' . dull_white
exe 'highlight Search gui=NONE guifg=' . bright_white 'guibg=' . dull_blue
exe 'highlight IncSearch gui=NONE guifg=' . slate_grey 'guibg=' . bright_blue
exe 'highlight CurSearch gui=bold guifg=' . slate_grey 'guibg=' . bright_blue
exe 'highlight MatchParen gui=bold guifg=' . slate_grey 'guibg=' . bright_blue

" diagnostic colors
exe 'highlight DiagnosticError gui=italic,bold,underline guifg=' . dull_yellow
exe 'highlight DiagnosticWarn gui=italic guifg=' . dull_yellow
exe 'highlight DiagnosticInfo gui=italic guifg=' . dull_white
exe 'highlight DiagnosticHint gui=italic guifg=' . dull_white
exe 'highlight DiagnosticOk gui=italic guifg=' . dull_white

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
exe 'highlight Title gui=underline,bold guifg=' . bright_black
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
exe 'highlight Whitespace gui=italic guifg=' . dull_white
exe 'highlight NonText gui=italic guifg=' . dull_white
exe 'highlight helpHeader gui=NONE guifg=' . dull_red

" treesitter
" some common ones that really should just be the base group regardless of
" language, but I can't highlight, for example, "@type.builtin" versus "type"
" the following does not work (output of :hi shows the correct color, but the
" actual text is not highlighted the specified color)
" highlight link @type.builtin NONE
" exe 'highlight @type.builtin gui=NONE guifg=' . dull_red

exe 'highlight @text.reference gui=underline'
exe 'highlight @attribute gui=NONE guifg=' . dull_purple
exe 'highlight @constructor gui=NONE guifg=' . slate_grey
exe 'highlight @type.qualifier gui=NONE guifg=' . dull_red
exe 'highlight @variable gui=NONE guifg=' . slate_grey
exe 'highlight @variable.builtin gui=NONE guifg=' . dull_red
exe 'highlight @function.builtin gui=NONE guifg=' . dull_red
exe 'highlight @comment.todo.comment gui=NONE guifg=' . bright_yellow 'guibg=' . bright_black

" syntax asciidoc
exe 'highlight asciidocListBullet gui=NONE guifg=' . dull_red
exe 'highlight asciidocAttributeList gui=NONE guifg=' . dull_white
exe 'highlight asciidocHLabel gui=NONE guifg=' . dull_orange
exe 'highlight asciidocHLabel gui=NONE guifg=' . dull_orange
exe 'highlight asciidocQuotedEmphasizedItalic gui=italic'

" treesitter bash
exe 'highlight @keyword.directive.bash gui=NONE guifg=' . dull_purple
exe 'highlight @variable.parameter.bash gui=NONE guifg=' . slate_grey

" syntax dockerfile
exe 'highlight dockerfileFrom gui=NONE guifg=' . dull_purple

" syntax git
exe 'highlight gitcommitSummary gui=NONE guifg=' . dull_red 'guibg=NONE'
exe 'highlight gitcommitOverflow gui=NONE guifg=' . dull_yellow 'guibg=NONE'
exe 'highlight gitcommitBlank gui=NONE guifg=' . slate_grey 'guibg=' . bright_yellow
exe 'highlight gitcommitBranch gui=NONE guifg=' . bright_white 'guibg=' . dull_red
exe 'highlight gitcommitHeader gui=NONE guifg=' . bright_white 'guibg=NONE'
exe 'highlight gitrebaseCommit gui=NONE guifg=' . dull_blue 'guibg=NONE'
exe 'highlight gitrebaseHash gui=NONE guifg=' . dull_blue 'guibg=NONE'
exe 'highlight gitrebaseSummary gui=NONE guifg=' . slate_grey 'guibg=NONE'
exe 'highlight gitrebasePick gui=NONE guifg=' . dull_red 'guibg=NONE'

" treesitter golang
exe 'highlight @type.builtin.go gui=NONE guifg=' . dull_red
exe 'highlight @type.definition.go gui=NONE guifg=' . slate_grey
exe 'highlight @constant.builtin.go gui=NONE guifg=' . dull_red

" treesitter html
exe 'highlight @tag.attribute gui=NONE guifg=' . slate_grey

" treesitter java
exe 'highlight @constant.builtin.java gui=NONE guifg=' . dull_red
exe 'highlight @type.builtin.java gui=NONE guifg=' . dull_red

" treesitter javascript
exe 'highlight @constant.builtin.javascript gui=NONE guifg=' . dull_red

" treesitter json
exe 'highlight @label.json gui=NONE guifg=' . slate_grey

" treesitter lua
exe 'highlight @constant.builtin.lua gui=NONE guifg=' . dull_red

" syntax makefile
exe 'highlight makeCommands gui=NONE guifg=' . slate_grey

" syntax markdown
exe 'highlight markdownCode gui=NONE guifg=' . bright_black
exe 'highlight markdownCodeDelimiter gui=bold guifg=' . bright_black

" treesitter markdown (causing issues)
exe 'highlight @markup.link.url.markdown_inline gui=NONE guifg=' . dull_purple
exe 'highlight @markup.list.markdown gui=bold guifg=' . dull_red

" treesitter rust
exe 'highlight @constant.builtin.rust gui=NONE guifg=' . dull_red
exe 'highlight @type.builtin.rust gui=NONE guifg=' . dull_red
exe 'highlight @lsp.type.formatspecifier.rust gui=NONE guifg=' . bright_black
exe 'highlight @lsp.typemod.decorator.attribute.rust gui=NONE guifg=' . dull_purple
exe 'highlight @lsp.typemod.attributeBracket.attribute.rust gui=NONE guifg=' . dull_purple

" syntax shell
exe 'highlight shQuote gui=NONE guifg=' . dull_orange 'guibg=NONE'

" treesitter sql
exe 'highlight @type.builtin.sql gui=NONE guifg=' . dull_red

" syntax ssh
exe 'highlight sshConfigMatch gui=NONE guifg=' . dull_red 'guibg=NONE'

" treesitter typescript
" TODO: there is still no way to highlight annotations/decorators in typescript
exe 'highlight @variable.builtin.typescript gui=NONE guifg=' . dull_red

" syntax xml
exe 'highlight xmlTagName gui=NONE guifg=' . dull_red 'guibg=NONE'
exe 'highlight xmlProcessingDelim gui=NONE guifg=' . dull_purple 'guibg=NONE'

" plugin-specific highlighting for vim-gitgutter
exe 'highlight GitGutterAdd gui=bold guifg=' . dull_green
exe 'highlight GitGutterChange gui=bold guifg=' . dull_blue
exe 'highlight GitGutterChangeDelete gui=bold guifg=' . dull_purple
exe 'highlight GitGutterDelete gui=bold guifg=' . dull_red

" unknown usage (in practice, obviously the groups exist), setting to magenta as a canary
exe 'highlight SpellCap gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight SpellLocal gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight SpellBad gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight Ignore gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight EnumerationName gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight EnumerationValue gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight Union gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight DefinedName gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight LocalVariable gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight CTagsImport gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight CTagsGlobalVariable gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight CTagsMember gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight CTagsGlobalConstant gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
exe 'highlight CTagsClass gui=NONE guifg=' . TEST_MAGENTA 'guibg=' . TEST_MAGENTA
