let s:extended_palette = get(g:, 'ayu_extended_palette', 0)

let g:ayu#palette['extended_fg_idle']          = {'light': '#828C99', 'mirage': '#607080', 'dark': '#3E4B59'}
let g:ayu#palette['extended_warning']          = {'light': '#FA8D3E', 'mirage': '#FFA759', 'dark': '#FF8F40'}
let g:ayu#palette['extended_float_bg']         = {'light': '#D8D8D8', 'mirage': '#2D323F', 'dark': '#161e26'}

if s:extended_palette
    let g:ayu#palette['extended_keyword_func'] = {'light': '#3EABFA', 'mirage': '#80AAFF', 'dark': '#40B0FF'}
    let g:ayu#palette['extended_repeat']       = {'light': '#FA3E4D', 'mirage': '#FF595E', 'dark': '#FF4051'}
    let g:ayu#palette['extended_conditional']  = {'light': '#F9700C', 'mirage': '#FF8214', 'dark': '#FF710D'}
    let g:ayu#palette['extended_import']       = {'light': '#FF7E0D', 'mirage': '#FFBB33', 'dark': '#E0A123'}
else
    let g:ayu#palette['extended_keyword_func'] = g:ayu#palette['keyword']
    let g:ayu#palette['extended_repeat']       = g:ayu#palette['keyword']
    let g:ayu#palette['extended_conditional']  = g:ayu#palette['keyword']
    let g:ayu#palette['extended_import']       = g:ayu#palette['accent']
endif

function! ayu#get_style()
    return &background ==# 'dark' ? get(g:, 'ayucolor', 'dark') : &background
endfunction

function! ayu#get_color(color_name)
    let l:style = ayu#get_style()

    return g:ayu#palette[a:color_name][l:style]
endfunction

function! ayu#hi(group_name, fg_color_name, bg_color_name, ...)
    let l:highlights = ['hi!', a:group_name]

    let l:fg_color = a:fg_color_name !=# '' ? ayu#get_color(a:fg_color_name) : 'NONE'
    call add(l:highlights, 'guifg=' . l:fg_color)

    let l:bg_color = a:bg_color_name !=# '' ? ayu#get_color(a:bg_color_name) : 'NONE'
    call add(l:highlights, 'guibg=' . l:bg_color)

    let l:fmt_arg = get(a:, '1')
    let l:fmt = l:fmt_arg !=# '0' && l:fmt_arg !=# '' ? l:fmt_arg : 'NONE'
    call add(l:highlights, 'gui=' . l:fmt)
    call add(l:highlights, 'cterm=' . l:fmt)

    let l:cmd = join(l:highlights, ' ')
    execute l:cmd
endfunction
