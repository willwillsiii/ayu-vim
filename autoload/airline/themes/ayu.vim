" Bootstrap: {{{

" Let's store all the colors in a dictionary.
let s:c = {}

let s:c.light_fg = { 'gui': ayu#get_color('editor_fg')       , 'cterm': 0 }
let s:c.light_bg = { 'gui': ayu#get_color('ui_panel_bg')     , 'cterm': 0 }
let s:c.dark_fg  = { 'gui': ayu#get_color('ui_fg')           , 'cterm': 0 }
let s:c.dark_bg  = { 'gui': ayu#get_color('ui_panel_shadow') , 'cterm': 0 }

let s:c.blue    = { 'gui': ayu#get_color('syntax_entity')   , 'cterm': 4 }
let s:c.green   = { 'gui': ayu#get_color('syntax_string')   , 'cterm': 2 }
let s:c.orange  = { 'gui': ayu#get_color('syntax_func')     , 'cterm': 9 }
let s:c.magenta = { 'gui': ayu#get_color('syntax_constant') , 'cterm': 13 }
let s:c.red     = { 'gui': ayu#get_color('vcs_removed')     , 'cterm': 1 }

let g:airline#themes#ayu#palette = {}

" Just remember:
" [guifg, guibg, ctermfg, ctermbg, opts]
function! s:Array(fg, bg, ...)
  let result = [s:c[a:fg].gui, s:c[a:bg].gui, s:c[a:fg].cterm, s:c[a:bg].cterm]

  for opt in a:000
    call add(result, opt)
  endfor

  return result
endfunction

" }}}

" Normal mode: {{{

" Colors.
let s:N1 = s:Array('light_bg', 'blue')
let s:N2 = s:Array('light_fg', 'dark_bg')
let s:N3 = s:Array('dark_fg', 'light_bg')

let g:airline#themes#ayu#palette.normal =
      \ airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Overrides for when the buffer is modified in normal mode.
let g:airline#themes#ayu#palette.normal_modified = {
      \ 'airline_c': s:Array('magenta', 'light_bg', '')
      \ }

" }}}

" Insert mode: {{{

" Colors.
let s:I1 = s:Array('light_bg', 'green')
let s:I2 = s:N2
let s:I3 = s:N3

let g:airline#themes#ayu#palette.insert =
      \ airline#themes#generate_color_map(s:I1, s:I2, s:I3)

" Overrides for when the buffer is modified in insert mode.
let g:airline#themes#ayu#palette.insert_modified = {
      \ 'airline_c': s:Array('magenta', 'light_bg', '')
      \ }

" Overrides for when the paste is toggled in insert mode.
let g:airline#themes#ayu#palette.insert_paste = {
      \ 'airline_a': [s:I1[0], s:c.orange.gui, s:I1[2], s:c.orange.cterm, ''] ,
      \ 'airline_z': [s:I1[0], s:c.orange.gui, s:I1[2], s:c.orange.cterm, ''] ,
      \ }

" }}}

" Replace mode: {{{

" Colors.
let s:R1 = s:Array('light_bg', 'red')
let s:R2 = s:N2
let s:R3 = s:N3

let g:airline#themes#ayu#palette.replace =
      \ airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Overrides for when the buffer is modified in normal mode.
let g:airline#themes#ayu#palette.replace_modified = {
      \ 'airline_c': s:Array('magenta', 'light_bg', '')
      \ }

" }}}

" Visual mode: {{{

" Colors.
let s:V1 = s:Array('light_bg', 'magenta')
let s:V2 = s:N2
let s:V3 = s:N3

let g:airline#themes#ayu#palette.visual =
      \ airline#themes#generate_color_map(s:V1, s:V2, s:V3)

" Overrides for when the buffer is modified.
let g:airline#themes#ayu#palette.visual_modified =
      \ g:airline#themes#ayu#palette.normal_modified

" }}}

" Inactive mode: (when the focus is not on the window) {{{

let s:IA1 = s:Array('light_fg', 'dark_bg')
let s:IA2 = s:Array('light_fg', 'light_bg')
let s:IA3 = s:Array('light_fg', 'light_bg')

let g:airline#themes#ayu#palette.inactive =
      \ airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

let g:airline#themes#ayu#palette.inactive_modified = {
      \ 'airline_c': [s:c.magenta.gui, '' , s:c.magenta.cterm, '', ''],
      \ }

" }}}

" Accents: {{{

" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a 'red' accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#ayu#palette.accents = {
      \ 'red': [s:c.red.gui, '', s:c.red.cterm, '']
      \ }

" }}}

" CtrlP: {{{

" Finish here if CtrlP isn't installed.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 = s:Array('dark_fg', 'light_bg', '')
let s:CP2 = s:Array('light_bg', 'blue', '')
let s:CP3 = s:Array('light_bg', 'green', 'bold')

let g:airline#themes#ayu#palette.ctrlp =
      \ airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)

" }}}
