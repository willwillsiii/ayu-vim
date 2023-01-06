" Initialisation: {{{

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ayu"
let s:ayu_sign_contrast = get(g:, 'ayu_sign_contrast', 0)
let s:ayu_italic_comment = get(g:, 'ayu_italic_comment', 0)

let s:sign_bg = s:ayu_sign_contrast ? 'ui_bg' : ''

"}}}

" Functions: {{{

let s:ayu_palette = {}
let s:ayu_palette['syntax_tag']                    = {'light': '#55b4d4', 'mirage': '#5ccfe6', 'dark': '#39bae6'}
let s:ayu_palette['syntax_func']                   = {'light': '#f2ae49', 'mirage': '#ffd173', 'dark': '#ffb454'}
let s:ayu_palette['syntax_entity']                 = {'light': '#399ee6', 'mirage': '#73d0ff', 'dark': '#59c2ff'}
let s:ayu_palette['syntax_string']                 = {'light': '#86b300', 'mirage': '#d5ff80', 'dark': '#aad94c'}
let s:ayu_palette['syntax_regexp']                 = {'light': '#4cbf99', 'mirage': '#95e6cb', 'dark': '#95e6cb'}
let s:ayu_palette['syntax_markup']                 = {'light': '#f07171', 'mirage': '#f28779', 'dark': '#f07178'}
let s:ayu_palette['syntax_keyword']                = {'light': '#fa8d3e', 'mirage': '#ffad66', 'dark': '#ff8f40'}
let s:ayu_palette['syntax_special']                = {'light': '#e6ba7e', 'mirage': '#ffdfb3', 'dark': '#e6b673'}
let s:ayu_palette['syntax_comment']                = {'light': '#adafb2', 'mirage': '#6e7c8e', 'dark': '#646b73'}
let s:ayu_palette['syntax_constant']               = {'light': '#a37acc', 'mirage': '#dfbfff', 'dark': '#d2a6ff'}
let s:ayu_palette['syntax_operator']               = {'light': '#ed9366', 'mirage': '#f29e74', 'dark': '#f29668'}
let s:ayu_palette['vcs_added']                     = {'light': '#6cbf43', 'mirage': '#87d96c', 'dark': '#7fd962'}
let s:ayu_palette['vcs_modified']                  = {'light': '#478acc', 'mirage': '#80bfff', 'dark': '#73b8ff'}
let s:ayu_palette['vcs_removed']                   = {'light': '#ff7383', 'mirage': '#f27983', 'dark': '#f26d78'}
let s:ayu_palette['editor_fg']                     = {'light': '#5c6166', 'mirage': '#cccac2', 'dark': '#bfbdb6'}
let s:ayu_palette['editor_bg']                     = {'light': '#fcfcfc', 'mirage': '#242936', 'dark': '#0d1017'}
let s:ayu_palette['editor_line']                   = {'light': '#f1f1f2', 'mirage': '#1a1f29', 'dark': '#131721'}
let s:ayu_palette['editor_selection_active']       = {'light': '#d7e4f6', 'mirage': '#2b4768', 'dark': '#1c3b5d'}
let s:ayu_palette['editor_selection_inactive']     = {'light': '#ebf1f9', 'mirage': '#283850', 'dark': '#142335'}
let s:ayu_palette['editor_findMatch_active']       = {'light': '#ecdcfd', 'mirage': '#695380', 'dark': '#6c5980'}
let s:ayu_palette['editor_findMatch_inactive']     = {'light': '#b266fe', 'mirage': '#403a54', 'dark': '#332d41'}
let s:ayu_palette['editor_gutter_active']          = {'light': '#a1a6ad', 'mirage': '#767c85', 'dark': '#626976'}
let s:ayu_palette['editor_gutter_normal']          = {'light': '#ced1d4', 'mirage': '#4d535e', 'dark': '#464b56'}
let s:ayu_palette['editor_indentGuide_active']     = {'light': '#d4d7d9', 'mirage': '#484d59', 'dark': '#3d424c'}
let s:ayu_palette['editor_indentGuide_normal']     = {'light': '#e7e9ea', 'mirage': '#363c48', 'dark': '#20242c'}
let s:ayu_palette['ui_fg']                         = {'light': '#8a9199', 'mirage': '#707a8c', 'dark': '#565b66'}
let s:ayu_palette['ui_bg']                         = {'light': '#f8f9fa', 'mirage': '#1f2430', 'dark': '#0b0e14'}
let s:ayu_palette['ui_line']                       = {'light': '#e7eaed', 'mirage': '#171b24', 'dark': '#11151c'}
let s:ayu_palette['ui_selection_active']           = {'light': '#e5e9ed', 'mirage': '#293040', 'dark': '#1a1f29'}
let s:ayu_palette['ui_selection_normal']           = {'light': '#e7eaed', 'mirage': '#282e3b', 'dark': '#171c24'}
let s:ayu_palette['ui_panel_bg']                   = {'light': '#f3f4f5', 'mirage': '#1c212b', 'dark': '#0f131a'}
let s:ayu_palette['ui_panel_shadow']               = {'light': '#d3d4d4', 'mirage': '#161a22', 'dark': '#06070a'}
let s:ayu_palette['common_accent']                 = {'light': '#ffaa33', 'mirage': '#ffcc66', 'dark': '#e6b450'}
let s:ayu_palette['common_error']                  = {'light': '#e65050', 'mirage': '#ff6666', 'dark': '#d95757'}

let s:extended_palette = get(g:, 'ayu_extended_palette', 0)

let s:ayu_palette['extended_fg_idle']          = {'light': '#828C99', 'mirage': '#607080', 'dark': '#3E4B59'}
let s:ayu_palette['extended_warning']          = {'light': '#FA8D3E', 'mirage': '#FFA759', 'dark': '#FF8F40'}
let s:ayu_palette['extended_float_bg']         = {'light': '#D8D8D8', 'mirage': '#2D323F', 'dark': '#161e26'}

if s:extended_palette
    let s:ayu_palette['extended_keyword_func'] = {'light': '#3EABFA', 'mirage': '#80AAFF', 'dark': '#40B0FF'}
    let s:ayu_palette['extended_repeat']       = {'light': '#FA3E4D', 'mirage': '#FF595E', 'dark': '#FF4051'}
    let s:ayu_palette['extended_conditional']  = {'light': '#F9700C', 'mirage': '#FF8214', 'dark': '#FF710D'}
    let s:ayu_palette['extended_import']       = {'light': '#FF7E0D', 'mirage': '#FFBB33', 'dark': '#E0A123'}
    let s:ayu_palette['extended_parameter']    = {'light': '#252729', 'mirage': '#DDEEE8', 'dark': '#ebeae6'}
else
    let s:ayu_palette['extended_keyword_func']   = s:ayu_palette['syntax_keyword']
    let s:ayu_palette['extended_repeat']         = s:ayu_palette['syntax_keyword']
    let s:ayu_palette['extended_conditional']    = s:ayu_palette['syntax_keyword']
    let s:ayu_palette['extended_import']         = s:ayu_palette['common_accent']
    let s:ayu_palette['extended_parameter']      = s:ayu_palette['syntax_special']
endif

let s:ayu_style = &background ==# 'dark' ? get(g:, 'ayucolor', 'dark') : &background

function! s:hi(group_name, fg_color_name, bg_color_name, ...)
    let l:fg_color = a:fg_color_name !=# '' ? s:ayu_palette[a:fg_color_name][s:ayu_style] : 'NONE'
    let l:bg_color = a:bg_color_name !=# '' ? s:ayu_palette[a:bg_color_name][s:ayu_style] : 'NONE'
    let l:fmt_arg = get(a:, '1')
    let l:fmt = l:fmt_arg !=# '0' && l:fmt_arg !=# '' ? l:fmt_arg : 'NONE'

    let l:cmd = ['hi!', a:group_name, 'guifg=' . l:fg_color, 'guibg=' . l:bg_color, 'gui=' . l:fmt, 'cterm=' . l:fmt]
    execute join(l:cmd, ' ')
endfunction

" }}}

call s:hi('AyuSyntaxTag', 'syntax_tag', '')
call s:hi('AyuSyntaxFunc', 'syntax_func', '')
call s:hi('AyuSyntaxEntity', 'syntax_entity', '')
call s:hi('AyuSyntaxString', 'syntax_string', '')
call s:hi('AyuSyntaxKeyword', 'syntax_keyword', '')
call s:hi('AyuSyntaxOperator', 'syntax_operator', '')
call s:hi('AyuSyntaxSpecial', 'syntax_special', '')
call s:hi('AyuCommonAccent', 'common_accent', '')
call s:hi('AyuExtendedKeywordFunc', 'extended_keyword_func', '')
call s:hi('AyuExtendedConditional', 'extended_conditional', '')
call s:hi('AyuExtendedRepeat', 'extended_repeat', '')
call s:hi('AyuExtendedImport', 'extended_import', '')

" Vim Highlighting: (see :help highlight-groups) {{{

call s:hi('Normal', 'editor_fg', 'editor_bg')
call s:hi('ColorColumn', '', 'editor_line')
call s:hi('CursorColumn', '', 'editor_line')
call s:hi('CursorLine', '', 'editor_line')
call s:hi('CursorLineNr', 'common_accent', 'editor_line')
call s:hi('LineNr', 'editor_gutter_normal', '')
hi! link Directory AyuSyntaxFunc
call s:hi('ErrorMsg', 'editor_fg', 'common_error', 'standout')
call s:hi('VertSplit', 'ui_panel_bg', 'ui_panel_bg')
call s:hi('Folded', 'extended_fg_idle', 'ui_bg')
hi! FoldColumn NONE
hi! SignColumn NONE
call s:hi('FoldColumn', '', s:sign_bg)
call s:hi('SignColumn', '', s:sign_bg)

call s:hi('MatchParen', 'editor_fg', 'editor_bg', 'underline')
hi! link ModeMsg AyuSyntaxString
hi! link MoreMsg AyuSyntaxString
call s:hi('NonText', 'editor_gutter_normal', '')
call s:hi('Pmenu', 'editor_fg', 'ui_bg')
call s:hi('PmenuSel', '', 'ui_selection_active')
hi! link Question AyuSyntaxString
call s:hi('Search', '', 'editor_findMatch_inactive')
call s:hi('IncSearch', '', 'editor_findMatch_active')
call s:hi('SpecialKey', 'editor_selection_inactive', '')
call s:hi('SpellCap', 'syntax_tag', '', 'underline')
call s:hi('SpellLocal', 'syntax_keyword', '', 'underline')
call s:hi('SpellBad', 'common_error', '', 'underline')
call s:hi('SpellRare', 'syntax_regexp', '', 'underline')
call s:hi('StatusLine', 'editor_fg', 'ui_panel_bg')
call s:hi('StatusLineNC', 'extended_fg_idle', 'ui_panel_bg')
call s:hi('WildMenu', 'editor_fg', 'syntax_markup')
call s:hi('TabLine', 'syntax_comment', 'ui_panel_shadow')
call s:hi('TabLineFill', 'editor_fg', 'ui_bg')
call s:hi('TabLineSel', 'editor_fg', 'editor_bg')
hi! link Title AyuSyntaxKeyword
call s:hi('Visual', '', 'editor_selection_inactive')
call s:hi('WarningMsg', 'extended_warning', '')

" Extended
hi! link Conditional AyuExtendedConditional
hi! link Repeat AyuExtendedRepeat

"}}}

" Neovim Highlights: {{{

call s:hi('NormalFloat', 'editor_fg', 'ui_panel_bg')
call s:hi('FloatBorder', 'editor_fg', 'ui_panel_bg')

" }}}

" Generic Syntax Highlighting: (see :help group-name) {{{

call s:hi('Comment', 'syntax_comment', '', s:ayu_italic_comment ? 'italic' : '')

call s:hi('Constant', 'syntax_constant', '', '')
hi! link String AyuSyntaxString

hi! link Identifier AyuSyntaxEntity
hi! link Function AyuSyntaxFunc

hi! link Statement AyuSyntaxKeyword
hi! link Operator AyuSyntaxOperator
call s:hi('Exception', 'syntax_markup', '')

hi! link PreProc AyuCommonAccent

hi! link Type AyuSyntaxEntity
hi! link Structure AyuSyntaxSpecial

hi! link Special AyuCommonAccent
hi! link Delimiter AyuSyntaxSpecial

call s:hi('Underlined', 'syntax_tag', '', 'underline')

call s:hi('Ignore', '', '')

call s:hi('Error', 'editor_fg', 'common_error')

call s:hi('Todo', 'syntax_markup', '')

" Quickfix window highlighting
hi! link qfLineNr AyuSyntaxKeyword

call s:hi('Conceal', 'syntax_comment', '')
call s:hi('CursorLineConceal', 'editor_gutter_normal', 'editor_line')

" Extended
hi! link PreCondit AyuExtendedConditional

"}}}

" Terminal: {{{

" if has("nvim")
"   let g:terminal_color_0 =  ayu#get_color('editor_bg')
"   let g:terminal_color_1 =  ayu#get_color('syntax_markup')
"   let g:terminal_color_2 =  ayu#get_color('syntax_string')
"   let g:terminal_color_3 =  ayu#get_color('common_accent')
"   let g:terminal_color_4 =  ayu#get_color('syntax_tag')
"   let g:terminal_color_5 =  ayu#get_color('syntax_constant')
"   let g:terminal_color_6 =  ayu#get_color('syntax_regexp')
"   let g:terminal_color_7 =  "#FFFFFF"
"   let g:terminal_color_8 =  ayu#get_color('extended_fg_idle')
"   let g:terminal_color_9 =  ayu#get_color('common_error')
"   let g:terminal_color_10 = ayu#get_color('syntax_string')
"   let g:terminal_color_11 = ayu#get_color('common_accent')
"   let g:terminal_color_12 = ayu#get_color('syntax_tag')
"   let g:terminal_color_13 = ayu#get_color('syntax_constant')
"   let g:terminal_color_14 = ayu#get_color('syntax_regexp')
"   let g:terminal_color_15 = ayu#get_color('syntax_comment')
"   let g:terminal_color_background = g:terminal_color_0
"   let g:terminal_color_foreground = ayu#get_color('editor_fg')
" else
"   let g:terminal_ansi_colors =  [ayu#get_color('editor_bg'),        ayu#get_color('syntax_markup')]
"   let g:terminal_ansi_colors += [ayu#get_color('syntax_string'),  ayu#get_color('common_accent')]
"   let g:terminal_ansi_colors += [ayu#get_color('syntax_tag'),     ayu#get_color('syntax_constant')]
"   let g:terminal_ansi_colors += [ayu#get_color('syntax_regexp'),  "#FFFFFF"]
"   let g:terminal_ansi_colors += [ayu#get_color('extended_fg_idle'), ayu#get_color('common_error')]
"   let g:terminal_ansi_colors += [ayu#get_color('syntax_string'),  ayu#get_color('common_accent')]
"   let g:terminal_ansi_colors += [ayu#get_color('syntax_tag'),     ayu#get_color('syntax_constant')]
"   let g:terminal_ansi_colors += [ayu#get_color('syntax_regexp'),  ayu#get_color('syntax_comment')]
" endif

" }}}

" Diff Syntax Highlighting: {{{
call s:hi('DiffAdd', 'vcs_added', 'editor_gutter_normal')
call s:hi('DiffAdded', 'vcs_added', '')
call s:hi('DiffChange', 'vcs_modified', 'editor_gutter_normal')
call s:hi('DiffDelete', 'vcs_removed', 'editor_gutter_normal')
call s:hi('DiffRemoved', 'vcs_removed', '')
call s:hi('DiffText', 'vcs_modified', 'editor_gutter_active')
"}}}

" Netrw: {{{
hi! link netrwClassify AyuSyntaxSpecial
" }}}

" GitGutter: {{{
call s:hi('GitGutterAdd', 'vcs_added', s:sign_bg)
call s:hi('GitGutterChange', 'vcs_modified', s:sign_bg)
call s:hi('GitGutterDelete', 'vcs_removed', s:sign_bg)
call s:hi('GitGutterChangeDelete', 'vcs_modified', s:sign_bg, 'underline')
" }}}

" Signify: {{{
call s:hi('SignifySignAdd', 'vcs_added', s:sign_bg)
call s:hi('SignifySignChange', 'vcs_modified', s:sign_bg)
call s:hi('SignifySignDelete', 'vcs_removed', s:sign_bg)
call s:hi('SignifySignChangeDelete', 'vcs_modified', s:sign_bg, 'underline')
" }}}

" NERDTree: {{{
call s:hi('NERDTreeOpenable', 'extended_fg_idle', '')
hi! link NERDTreeClosable AyuCommonAccent
call s:hi('NERDTreeUp', 'extended_fg_idle', '')
hi! link NERDTreeDir AyuSyntaxFunc
call s:hi('NERDTreeFile', '', '')
hi! link NERDTreeDirSlash AyuSyntaxSpecial
" }}}

" Telescope: {{{
hi! link TelescopeMatching AyuCommonAccent
" }}}

" Neovim Diagnostics: {{{
call s:hi('DiagnosticDefaultError', 'common_error', '')
call s:hi('DiagnosticUnderlineError', 'common_error', '', 'underline')
call s:hi('DiagnosticSignError', 'common_error', s:sign_bg)

call s:hi('DiagnosticDefaultWarn', 'extended_warning', '')
call s:hi('DiagnosticUnderlineWarn', 'extended_warning', '', 'underline')
call s:hi('DiagnosticSignWarn', 'extended_warning', s:sign_bg)

call s:hi('DiagnosticVirtualTextHint', 'extended_fg_idle', '')
call s:hi('DiagnosticSignHint', 'editor_fg', s:sign_bg)

call s:hi('DiagnosticVirtualTextInfo', 'extended_fg_idle', '')
call s:hi('DiagnosticSignInfo', 'editor_fg', s:sign_bg)
" }}}

" Neovim Builtin LSP: {{{
call s:hi('LspDiagnosticsDefaultError', 'common_error', '')
call s:hi('LspDiagnosticsUnderlineError', 'common_error', '', 'underline')
call s:hi('LspDiagnosticsSignError', 'common_error', s:sign_bg)

call s:hi('LspDiagnosticsDefaultWarning', 'extended_warning', '')
call s:hi('LspDiagnosticsUnderlineWarning', 'extended_warning', '', 'underline')
call s:hi('LspDiagnosticsSignWarning', 'extended_warning', s:sign_bg)

call s:hi('LspDiagnosticsVirtualTextHint', 'extended_fg_idle', '')
call s:hi('LspDiagnosticsSignHint', 'editor_fg', s:sign_bg)

call s:hi('LspDiagnosticsVirtualTextInformation', 'extended_fg_idle', '')
call s:hi('LspDiagnosticsSignInformation', 'editor_fg', s:sign_bg)

hi! link LspReferenceRead Visual

if has('nvim')
    hi! link @struct Type
    hi! link @interface Type
    hi! link @enum Type
    hi! link @builtinType Type
    hi! link @class Type

    hi! link @controlFlow AyuExtendedConditional
endif

" }}}

" YATS: {{{

call s:hi('typescriptDecorator', 'syntax_markup', '')
call s:hi('typescriptImport', 'extended_import', '')
hi! link typescriptExport AyuCommonAccent
call s:hi('typescriptIdentifier', 'syntax_tag', '', 'italic')
hi! link typescriptAssign AyuSyntaxOperator
hi! link typescriptBinaryOp AyuSyntaxOperator
hi! link typescriptTernaryOp AyuSyntaxOperator
hi! link typescriptModule AyuSyntaxKeyword
hi! link typescriptTypeBrackets AyuSyntaxSpecial
" call s:hi('typescriptClassName', 'syntax_tag', '')
hi! link typescriptclassName AyuSyntaxTag
hi! link typescriptAmbientDeclaration AyuSyntaxKeyword
call s:hi('typescriptRegexpString', 'syntax_regexp', '')
call s:hi('typescriptTry', 'syntax_markup', '')
call s:hi('typescriptExceptions', 'syntax_markup', '')
call s:hi('typescriptDebugger', 'syntax_markup', '', 'bold')
hi! link typescriptParens AyuSyntaxSpecial
hi! link typescriptVariable AyuSyntaxKeyword
" call s:hi('typescriptObjectLabel', 'syntax_tag', '')
hi! link typescriptObjectLabel AyuSyntaxTag
hi! link typescriptOperator AyuSyntaxKeyword
hi! link typescriptArrowFunc AyuSyntaxOperator
hi! link typescriptBraces AyuSyntaxSpecial
hi! link typescriptGlobal AyuCommonAccent

" Prop
hi! link typescriptDOMFormProp AyuSyntaxEntity
hi! link typescriptDOMEventProp AyuSyntaxEntity
hi! link typescriptBOMWindowProp AyuCommonAccent

" Method
hi! link typescriptDateMethod AyuSyntaxFunc
hi! link typescriptBlobMethod AyuSyntaxFunc
hi! link typescriptArrayMethod AyuSyntaxFunc
hi! link typescriptArrayStaticMethod AyuSyntaxFunc
hi! link typescriptStringMethod AyuSyntaxFunc
hi! link typescriptPaymentMethod AyuSyntaxFunc
hi! link typescriptHeadersMethod AyuSyntaxFunc
hi! link typescriptCacheMethod AyuSyntaxFunc
hi! link typescriptDOMEventMethod AyuSyntaxFunc
hi! link typescriptDOMEventTargetMethod AyuSyntaxFunc
hi! link typescriptBOMWindowMethod AyuSyntaxFunc
hi! link typescriptDOMStorageMethod AyuSyntaxFunc
hi! link typescriptPromiseMethod AyuSyntaxFunc
hi! link typescriptGlobalMethod AyuSyntaxFunc
hi! link typescriptFunctionMethod AyuSyntaxFunc
hi! link typescriptBOMLocationMethod AyuSyntaxFunc

" Extended
hi! link typescriptFuncKeyword AyuExtendedKeywordFunc
hi! link typescriptConditional AyuExtendedConditional
hi! link typescriptCase AyuExtendedConditional
hi! link typescriptRepeat AyuExtendedRepeat
hi! link typescriptBranch AyuExtendedRepeat
call s:hi('typescriptCall', 'extended_parameter', '')
call s:hi('typescriptArrowFuncArg', 'extended_parameter', '')

" }}}

" Javascript: {{{

call s:hi('jsNull', 'syntax_constant', '')
call s:hi('jsThis', 'syntax_constant', '', 'italic')

hi! link jsBrackets AyuSyntaxSpecial
hi! link jsDot AyuSyntaxSpecial
hi! link jsParens AyuSyntaxSpecial
hi! link jsFuncParens AyuSyntaxSpecial
hi! link jsFuncBraces AyuSyntaxSpecial
hi! link jsIfElseBraces AyuSyntaxSpecial

" call s:hi('jsObjectKey', 'syntax_tag', '')
hi! link jsObjectKey AyuSyntaxTag
" call s:hi('jsObjectProp', 'syntax_tag', '')
hi! link jsObjectProp AyuSyntaxTag

call s:hi('jsRegexpString', 'syntax_regexp', '')

hi! link jsStorageClass AyuSyntaxKeyword

hi! link jsArrowFunction AyuSyntaxOperator

" Extended
hi! link jsFunction AyuExtendedKeywordFunc

" }}}

" TreeSitter: {{{

if has('nvim')
    hi! link @annotation PreProc
    call s:hi('@attribute', 'syntax_markup', '')

    hi! link @conditional AyuExtendedConditional
    call s:hi('@constant.builtin', 'syntax_constant', '')

    " call s:hi('@field', 'syntax_tag', '')
    hi! link @field AyuSyntaxTag
    hi! link @function.call @function
    hi! link @function.macro AyuSyntaxFunc

    call s:hi('@include', 'extended_import', '')

    hi! link @keyword.function AyuExtendedKeywordFunc
    hi! link @keyword.operator @operator
    hi! link @keyword.return AyuExtendedConditional

    hi! link @method.call @method

    hi! link @namespace Include

    call s:hi('@parameter', 'extended_parameter', '')
    hi! link @parameter.reference @parameter
    " call s:hi('@property', 'syntax_tag', '')
    hi! link @property AyuSyntaxTag
    hi! link @punctuation.delimiter @punctuation
    hi! link @punctuation.bracket @punctuation
    hi! link @punctuation.special @punctuation

    hi! link @repeat AyuExtendedRepeat

    call s:hi('@string.regex', 'syntax_regexp', '')
    hi! link @string.special SpecialChar
    hi! link @symbol Identifier

    hi! link @tag AyuSyntaxKeyword
    hi! link @tag.delimiter Delimiter
    " call s:hi('@tag.attribute', 'syntax_tag', '')
    hi! link @tag.attribute AyuSyntaxTag

    hi @text.strong gui=bold
    hi @text.emphasis gui=italic
    hi @text.underline gui=underline
    hi @text.strike gui=strikethrough
    hi! link @text.title Title
    hi! link @text.literal String
    hi! link @text.uri Underlined
    hi! link @text.math Special
    hi! link @text.reference Constant
    hi! link @text.environment Macro
    hi! link @text.environment.name Type
    hi! link @text.note SpecialComment
    hi! link @text.warning Todo
    hi! link @text.danger WarningMsg
    hi! link @type.builtin Type
    hi! link @type.qualifier Type
    hi! link @variable NONE
    call s:hi('@variable.builtin', 'syntax_constant', '', 'italic')
endif

" Deprecated:
" call s:hi('TSField', 'syntax_tag', '')
hi! link TSField AyuSyntaxTag
" call s:hi('TSProperty', 'syntax_tag', '')
hi! link TSProperty AyuSyntaxTag

call s:hi('TSAttribute', 'syntax_markup', '')

call s:hi('TSVariableBuiltin', 'syntax_constant', '', 'italic')
call s:hi('TSConstBuiltin', 'syntax_constant', '')

call s:hi('TSStringRegex', 'syntax_regexp', '')

hi! link TSFunction AyuSyntaxFunc
hi! link TSFuncMacro AyuSyntaxFunc

hi! link TSTypeBuiltin Type
hi! link TSMethodCall Function

" Extended
call s:hi('TSInclude', 'extended_import', '')
hi! link TSKeywordFunction AyuExtendedKeywordFunc
hi! link TSRepeat AyuExtendedRepeat
hi! link TSConditional AyuExtendedConditional
call s:hi('TSParameter', 'extended_parameter', '')

" }}}

" Fugitive: {{{
hi! link fugitiveUntrackedHeading AyuCommonAccent
hi! link fugitiveUnstagedHeading AyuCommonAccent
hi! link fugitiveStagedHeading AyuCommonAccent
hi! link fugitiveHeading AyuCommonAccent
" }}}

" Git Commit: {{{
hi! link gitcommitBranch AyuSyntaxFunc
hi! link gitcommitHeader AyuCommonAccent
call s:hi('gitcommitSummary', 'editor_fg', '')
call s:hi('gitcommitOverflow', 'syntax_markup', '')
" }}}

" Startify: {{{
call s:hi('StartifyFile', 'editor_fg', '')
" }}}

" Vim: {{{
hi! link vimUserFunc AyuSyntaxFunc
hi! link vimVar NONE
hi! link vimFunction AyuSyntaxFunc
call s:hi('vimIsCommand', '', '')
" }}}

" XML: {{{

hi! link xmlTag AyuSyntaxSpecial
hi! link xmlTagName AyuSyntaxKeyword
" call s:hi('xmlEntity', 'syntax_tag', '')
hi! link xmlEntity AyuSyntaxTag
hi! link xmlEntityPunct AyuSyntaxOperator
hi! link xmlEqual AyuSyntaxOperator

" }}}

" INI: {{{
hi! link dosiniHeader AyuSyntaxKeyword
" }}}

" Pandoc: {{{

hi! link pandocPipeTableHeader AyuSyntaxKeyword
hi! link pandocPipeTableDelims AyuSyntaxKeyword
hi! link pandocDelimitedCodeBlock AyuCommonAccent

" }}}

" Shell: {{{

hi! link shTestOpr AyuSyntaxOperator
hi! link shOption AyuSyntaxSpecial
hi! link shQuote AyuSyntaxString

" }}}

" Haskell: {{{

hi! link haskellDeclKeyword AyuSyntaxKeyword
hi! link haskellLet AyuSyntaxKeyword
hi! link haskellWhere AyuSyntaxKeyword
" call s:hi('haskellIdentifier', 'syntax_tag', '')
hi! link haskellIdentifier AyuSyntaxTag

" }}}

" PHP: {{{

hi! link phpDefine AyuSyntaxKeyword
hi! link phpStructure AyuSyntaxKeyword

" }}}

" Ruby: {{{

hi! link rubyModule AyuSyntaxKeyword
call s:hi('rubyRegexp', 'syntax_regexp', '')
call s:hi('rubyRegexpDelimiter', 'syntax_regexp', '')
hi! link rubyStringDelimiter AyuSyntaxString

" }}}

" Compe: {{{

hi! link CompeDocumentation NormalFloat

" }}}

" Cmp: {{{

hi! link CmpItemAbbrMatch AyuCommonAccent
hi! link CmpItemAbbrMatchFuzzy AyuCommonAccent

" Highlights for cmp item types
call s:hi('CmpItemAbbrDeprecated', '', '', 'strikethrough')

hi! link CmpItemKindInterface AyuSyntaxEntity
hi! link CmpItemKindClass AyuSyntaxEntity
hi! link CmpItemKindEnum AyuSyntaxEntity
hi! link CmpItemKindStruct AyuSyntaxEntity

hi! link CmpItemKindFunction AyuSyntaxFunc
hi! link CmpItemKindMethod AyuSyntaxFunc

hi! link CmpItemKindKeyword AyuSyntaxKeyword
hi! link CmpItemKindOperator AyuSyntaxKeyword

" call s:hi('CmpItemKindProperty', 'syntax_tag', '')
hi! link CmpItemKindProperty AyuSyntaxTag
" call s:hi('CmpItemKindField', 'syntax_tag', '')
hi! link CmpItemKindField AyuSyntaxTag

call s:hi('CmpItemKindText', 'syntax_comment', '')
call s:hi('CmpItemKindSnippet', 'syntax_comment', '')

call s:hi('CmpItemKindModule', 'extended_import', '')

call s:hi('CmpItemKindConstant', 'syntax_constant', '')

hi! link CmpItemKindConstructor AyuCommonAccent

" }}}

" Indent Blankline: {{{

call s:hi('IndentBlanklineChar', 'editor_indentGuide_normal', '')
call s:hi('IndentBlanklineContextChar', 'editor_indentGuide_active', '')

" }}}

" hlargs.nvim: {{{

hi! link Hlargs TSParameter

" }}}

" vim-illuminate: {{{

hi! link IlluminatedWordRead Visual
hi! link IlluminatedWordText Visual
call s:hi('IlluminatedWordWrite', '', 'editor_selection_active')

" }}}

" nvim-lspconfig: {{{

hi! link LspInfoBorder FloatBorder

" }}}

" nvim-navic: {{{

"vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, bg = "#000000", fg = "#ffffff"})
hi! link NavicIconsModule Include
hi! link NavicIconsNamespace Include
hi! link NavicIconsPackage Include
hi! link NavicIconsClass Keyword
hi! link NavicIconsMethod Function
" call s:hi('NavicIconsProperty', 'syntax_tag', '')
hi! link NavicIconsProperty AyuSyntaxTag
" call s:hi('NavicIconsField', 'syntax_tag', '')
hi! link NavicIconsField AyuSyntaxTag
hi! link NavicIconsConstructor Special
hi! link NavicIconsEnum Keyword
hi! link NavicIconsInterface Keyword
hi! link NavicIconsFunction Function
call s:hi('NavicIconsVariable', 'editor_fg', '')
hi! link NavicIconsConstant Constant
hi! link NavicIconsString String
hi! link NavicIconsNumber Number
hi! link NavicIconsBoolean Boolean
hi! link NavicIconsArray Operator
hi! link NavicIconsObject Operator
"vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, bg = "#000000", fg = "#ffffff"})
hi! link NavicIconsNull Constant
" call s:hi('NavicIconsEnumMember', 'syntax_tag', '')
hi! link NavicIconsEnumMember AyuSyntaxTag
hi! link NavicIconsStruct Keyword
"vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, bg = "#000000", fg = "#ffffff"})
hi! link NavicIconsOperator Operator
" call s:hi('NavicIconsTypeParameter', 'syntax_tag', '')
hi! link NavicIconsTypeParameter AyuSyntaxTag
hi! link NavicText Comment
hi! link NavicSeparator Comment

" }}}

" CoC.nvim: {{{

hi! link CocInlayHint Comment
hi! link CocSearch AyuCommonAccent
hi! link CocSemVariable NONE

" }}}
