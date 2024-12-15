set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

" this theme really only works with true color terminals
set t_Co=256
let g:colors_name = "snobbishness"

" TODO: all these variables for colors are leaked, maybe do something about that
let TEST_MAGENTA = '#ff00ff'

let reddish_dark = '#2a2020' " background
let neutral_grey = '#aaaaaa' " foreground
let dull_black = '#606060'
let bright_black = '#101010' " hacky workaround for #000000 not working in some guis
let dull_red = '#90000c'
let bright_red = '#b4676d'
let dull_green = '#1f5a31'
let bright_green = '#78d0af'
let dull_yellow = '#9c7f0c'
let bright_yellow = '#c8af4a'
let dull_blue = '#49a0ff'
let bright_blue = '#9eb8e0'
let dull_orange = '#b05d13'
let bright_orange = '#c0814b'
let dull_purple = '#9737bc'
let bright_purple = '#a57db5'
let dull_white = '#aaaaaa'
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
exe 'highlight Cursor gui=NONE guifg=' . reddish_dark 'guibg=' . neutral_grey
exe 'highlight Normal gui=NONE guifg=' . neutral_grey 'guibg=' . reddish_dark
exe 'highlight Visual gui=NONE guifg=' . dull_white 'guibg=' . dull_black
exe 'highlight VisualNOS gui=NONE guifg=' . dull_white 'guibg=' . dull_black
exe 'highlight WildMenu gui=NONE guifg=' . dull_orange 'guibg=' . dull_black
exe 'highlight NonText gui=italic guifg=' . bright_red
exe 'highlight ErrorMsg gui=NONE guifg=' . dull_white 'guibg=' . dull_yellow
exe 'highlight LineNr gui=NONE guifg=' . dull_white 'guibg=NONE'
exe 'highlight CursorLineNr gui=NONE guifg=' . dull_red
exe 'highlight WarningMsg gui=italic guifg=' . dull_yellow
exe 'highlight ModeMsg gui=NONE guifg=' . bright_white 'guibg=' . dull_red
exe 'highlight MoreMsg gui=NONE guifg=' . bright_black
exe 'highlight VertSplit gui=NONE guifg=' . reddish_dark 'guibg=NONE'
exe 'highlight WinSeparator gui=NONE guifg=background guibg=NONE'
exe 'highlight Directory gui=bold guifg=' . dull_red
exe 'highlight SpecialKey gui=italic guifg=' . bright_white
exe 'highlight TabLine gui=NONE guifg=' . bright_white 'guibg=' . bright_black
exe 'highlight TabLineSel gui=NONE guifg=' . dull_red 'guibg=' . reddish_dark
exe 'highlight TabLineFill gui=NONE guibg=' . bright_black
exe 'highlight StatusLine gui=NONE guifg=' . dull_white 'guibg=' . dull_red
exe 'highlight StatusLineNC gui=NONE guifg=' . dull_white 'guibg=' . bright_black
exe 'highlight StatusLineFlag gui=bold guifg=' . dull_white 'guibg=' . dull_red
exe 'highlight StatusLineModified gui=bold guifg=' . dull_white 'guibg=' . dull_red
exe 'highlight PMenu gui=NONE guifg=' . neutral_grey 'guibg=' . bright_black
exe 'highlight PmenuSel gui=NONE guifg=' . dull_red 'guibg=' . dull_white
exe 'highlight PmenuSbar gui=NONE guibg=' . dull_white
exe 'highlight PmenuThumb gui=NONE guibg=' . dull_black
exe 'highlight SignColumn gui=NONE guifg=' . neutral_grey 'guibg=NONE'
exe 'highlight FoldColumn gui=NONE guifg=' . neutral_grey 'guibg=NONE'
exe 'highlight netrwDir gui=NONE guifg=' . dull_orange
exe 'highlight ColorColumn gui=NONE guibg=' . dull_white
exe 'highlight QuickFixLine gui=NONE guibg=' . dull_white
exe 'highlight qfLineNr gui=NONE guifg=' . dull_green
exe 'highlight Question gui=bold guifg=' . dull_red
exe 'highlight NormalFloat gui=NONE guibg=' . bright_black

" editor contextual colors
exe 'highlight CursorLine guibg=' . dull_white
exe 'highlight Search gui=NONE guifg=' . bright_white 'guibg=' . dull_purple
exe 'highlight IncSearch gui=NONE guifg=' . bright_white 'guibg=' . bright_purple
exe 'highlight CurSearch gui=bold guifg=' . bright_white 'guibg=' . bright_purple
exe 'highlight LspSignatureActiveParameter gui=NONE guifg=' . bright_white 'guibg=' . dull_purple
exe 'highlight MatchParen gui=bold guifg=' . bright_white 'guibg=' . dull_purple

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
exe 'highlight diffLine gui=NONE guifg=' . dull_black
exe 'highlight diffIndexLine gui=NONE guifg=' . dull_black

" syntax colors
exe 'highlight Underlined gui=underline guifg=' . neutral_grey
exe 'highlight Title gui=underline,bold guifg=' . dull_orange
exe 'highlight Comment gui=italic guifg=' . bright_red
exe 'highlight Todo gui=italic guifg=' . bright_white
exe 'highlight Typedef gui=NONE guifg=' . dull_red
exe 'highlight Debug gui=NONE guifg=' . bright_yellow
exe 'highlight Conditional gui=NONE guifg=' . dull_red
exe 'highlight Special gui=NONE guifg=' . bright_white
exe 'highlight SpecialChar gui=NONE guifg=' . bright_white
exe 'highlight Delimiter gui=NONE guifg=' . neutral_grey
exe 'highlight StorageClass gui=NONE guifg=' . dull_red
exe 'highlight Exception gui=NONE guifg=' . dull_red
exe 'highlight Function gui=NONE guifg=' . neutral_grey
exe 'highlight Label gui=NONE guifg=' . dull_green
exe 'highlight Keyword gui=NONE guifg=' . dull_red
exe 'highlight Constant gui=NONE guifg=' . neutral_grey
exe 'highlight Repeat gui=NONE guifg=' . dull_red
exe 'highlight Type gui=NONE guifg=' . neutral_grey
exe 'highlight Identifier gui=NONE guifg=' . neutral_grey
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
exe 'highlight Error gui=NONE guifg=' . dull_white 'guibg=' . dull_yellow
exe 'highlight Whitespace gui=italic guifg=' . bright_red
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
exe 'highlight @constructor gui=NONE guifg=' . neutral_grey
exe 'highlight @type.qualifier gui=NONE guifg=' . dull_red
exe 'highlight @variable gui=NONE guifg=' . neutral_grey
exe 'highlight @variable.builtin gui=NONE guifg=' . dull_red
exe 'highlight @function.builtin gui=NONE guifg=' . dull_red
exe 'highlight @punctuation.delimiter.comment gui=NONE guifg=' . bright_red
exe 'highlight @comment.note.comment gui=italic guifg=' . bright_red
exe 'highlight @string.special.url.comment gui=underline guifg=' . bright_red

" exe 'highlight @comment.todo.comment gui=NONE guifg=' . bright_yellow 'guibg=' . bright_black

" syntax asciidoc
exe 'highlight asciidocListBullet gui=NONE guifg=' . dull_red
exe 'highlight asciidocAttributeList gui=NONE guifg=' . dull_white
exe 'highlight asciidocHLabel gui=NONE guifg=' . dull_orange
exe 'highlight asciidocHLabel gui=NONE guifg=' . dull_orange
exe 'highlight asciidocQuotedEmphasizedItalic gui=italic'

" treesitter bash
exe 'highlight @keyword.directive.bash gui=NONE guifg=' . dull_purple
exe 'highlight @variable.parameter.bash gui=NONE guifg=' . neutral_grey

" syntax dockerfile
exe 'highlight dockerfileFrom gui=NONE guifg=' . dull_purple

" syntax git
exe 'highlight gitcommitSummary gui=NONE guifg=' . dull_red 'guibg=NONE'
exe 'highlight gitcommitOverflow gui=NONE guifg=' . dull_yellow 'guibg=NONE'
exe 'highlight gitcommitBlank gui=NONE guifg=' . neutral_grey 'guibg=' . bright_yellow
exe 'highlight gitcommitBranch gui=NONE guifg=' . bright_white 'guibg=' . dull_red
exe 'highlight gitcommitHeader gui=NONE guifg=' . bright_white 'guibg=NONE'
exe 'highlight gitrebaseCommit gui=NONE guifg=' . dull_blue 'guibg=NONE'
exe 'highlight gitrebaseHash gui=NONE guifg=' . dull_blue 'guibg=NONE'
exe 'highlight gitrebaseSummary gui=NONE guifg=' . neutral_grey 'guibg=NONE'
exe 'highlight gitrebasePick gui=NONE guifg=' . dull_red 'guibg=NONE'
exe 'highlight gitignoreNegation gui=NONE guifg=' . dull_red 'guibg=NONE'

" treesitter golang
exe 'highlight @type.builtin.go gui=NONE guifg=' . dull_red
exe 'highlight @type.definition.go gui=NONE guifg=' . neutral_grey
exe 'highlight @constant.builtin.go gui=NONE guifg=' . dull_red

" treesitter html
exe 'highlight @tag.attribute gui=NONE guifg=' . neutral_grey

" treesitter java
exe 'highlight @constant.builtin.java gui=NONE guifg=' . dull_red
exe 'highlight @type.builtin.java gui=NONE guifg=' . dull_red

" treesitter javascript
exe 'highlight @constant.builtin.javascript gui=NONE guifg=' . dull_red

" treesitter json
exe 'highlight @label.json gui=NONE guifg=' . neutral_grey

" treesitter lua
exe 'highlight @constant.builtin.lua gui=NONE guifg=' . dull_red

" syntax makefile
exe 'highlight makeCommands gui=NONE guifg=' . neutral_grey

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
