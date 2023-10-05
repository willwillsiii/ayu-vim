let g:ayu#palette['extended_fg_idle']          = {'light': '#828C99', 'mirage': '#607080', 'dark': '#3E4B59'}
let g:ayu#palette['extended_warning']          = {'light': '#FA8D3E', 'mirage': '#FFA759', 'dark': '#FF8F40'}
let g:ayu#palette['extended_float_bg']         = {'light': '#D8D8D8', 'mirage': '#2D323F', 'dark': '#161e26'}

let g:ayu#palette['extended_delimiter_1'] = {'light': '#F0D5AF', 'mirage': '#FFF9EC', 'dark': '#F0D2A8'}
let g:ayu#palette['extended_delimiter_2'] = {'light': '#E6BA7E', 'mirage': '#FFE6B3', 'dark': '#E6B673'}
let g:ayu#palette['extended_delimiter_3'] = {'light': '#B89565', 'mirage': '#FFCA5A', 'dark': '#B8915C'}
let g:ayu#palette['extended_delimiter_4'] = {'light': '#8A704C', 'mirage': '#FFAE00', 'dark': '#8A7D45'}

let s:extended_palette = get(g:, 'ayu_extended_palette', 0)

if s:extended_palette
    let g:ayu#palette['extended_keyword_func'] = {'light': '#3EABFA', 'mirage': '#80AAFF', 'dark': '#40B0FF'}
    let g:ayu#palette['extended_repeat']       = {'light': '#FA3E4D', 'mirage': '#FF595E', 'dark': '#FF4051'}
    let g:ayu#palette['extended_conditional']  = {'light': '#F9700C', 'mirage': '#FF8214', 'dark': '#FF710D'}
    let g:ayu#palette['extended_import']       = {'light': '#FF7E0D', 'mirage': '#FFBB33', 'dark': '#E0A123'}
    let g:ayu#palette['extended_parameter']    = {'light': '#252729', 'mirage': '#DDEEE8', 'dark': '#ebeae6'}

    let g:ayu#palette['extended_enum']      = {'light': '#729BFF', 'mirage': '#91B6FF', 'dark': '#8CB1FF'}
    let g:ayu#palette['extended_interface'] = {'light': '#5FCFCF', 'mirage': '#70E6D2', 'dark': '#85EAEE'}
    let g:ayu#palette['extended_struct']    = {'light': '#71B9ED', 'mirage': '#9DDEFF', 'dark': '#8BD4FF'}
    let g:ayu#palette['extended_generic']   = {'light': '#998CC3', 'mirage': '#AABBEE', 'dark': '#8F8FFF'}
    let g:ayu#palette['extended_namespace'] = {'light': '#F2976F', 'mirage': '#FFA375', 'dark': '#FFB179'}
else
    let g:ayu#palette['extended_keyword_func'] = g:ayu#palette['syntax_keyword']
    let g:ayu#palette['extended_repeat']       = g:ayu#palette['syntax_keyword']
    let g:ayu#palette['extended_conditional']  = g:ayu#palette['syntax_keyword']
    let g:ayu#palette['extended_import']       = g:ayu#palette['common_accent']
    let g:ayu#palette['extended_parameter']    = g:ayu#palette['syntax_special']

    let g:ayu#palette['extended_enum']      = g:ayu#palette['syntax_entity']
    let g:ayu#palette['extended_interface'] = g:ayu#palette['syntax_entity']
    let g:ayu#palette['extended_struct']    = g:ayu#palette['syntax_entity']
    let g:ayu#palette['extended_generic']   = g:ayu#palette['syntax_entity']
    let g:ayu#palette['extended_namespace'] = g:ayu#palette['common_accent']
endif

function! ayu#get_style()
    return &background ==# 'dark' ? get(g:, 'ayucolor', 'dark') : &background
endfunction

function! ayu#get_color(color_name)
    return g:ayu#palette[a:color_name][ayu#get_style()]
endfunction

function! ayu#hi(group_name, fg_color_name, bg_color_name, ...)
    let l:fg_color = a:fg_color_name !=# '' ? ayu#get_color(a:fg_color_name) : 'NONE'
    let l:bg_color = a:bg_color_name !=# '' ? ayu#get_color(a:bg_color_name) : 'NONE'

    let l:fmt_arg = get(a:, '1')
    let l:fmt = l:fmt_arg !=# '0' && l:fmt_arg !=# '' ? l:fmt_arg : 'NONE'

    execute join(['hi!', a:group_name, 'guifg=' . l:fg_color, 'guibg=' . l:bg_color, 'gui=' . l:fmt, 'cterm=' . l:fmt], ' ')
endfunction
