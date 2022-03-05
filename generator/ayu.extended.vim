let s:extended_palette = get(g:, 'ayu_extended_palette', 0)

let g:ayu#palette['light']['extended_fg_idle'] = '#828C99'
let g:ayu#palette['mirage']['extended_fg_idle'] = '#607080'
let g:ayu#palette['dark']['extended_fg_idle'] = '#3E4B59'

let g:ayu#palette['light']['extended_warning'] = '#FA8D3E'
let g:ayu#palette['mirage']['extended_warning'] = '#FFA759'
let g:ayu#palette['dark']['extended_warning'] = '#FF8F40'

let g:ayu#palette['light']['extended_float_bg'] = '#D8D8D8'
let g:ayu#palette['mirage']['extended_float_bg'] = '#2D323F'
let g:ayu#palette['dark']['extended_float_bg'] = '#161e26'

if s:extended_palette
    let g:ayu#palette['light']['extended_keyword_func']  = '#3EABFA'
    let g:ayu#palette['light']['extended_repeat']        = '#FA3E4D'
    let g:ayu#palette['light']['extended_conditional']   = '#F9700C'
    let g:ayu#palette['light']['accent']                 = '#FF7E0D'

    let g:ayu#palette['mirage']['extended_keyword_func'] = '#80AAFF'
    let g:ayu#palette['mirage']['extended_repeat']       = '#FF595E'
    let g:ayu#palette['mirage']['extended_conditional']  = '#FF8214'
    let g:ayu#palette['mirage']['accent']                = '#FFBB33'

    let g:ayu#palette['dark']['extended_keyword_func']   = '#40B0FF'
    let g:ayu#palette['dark']['extended_repeat']         = '#FF4051'
    let g:ayu#palette['dark']['extended_conditional']    = '#FF710D'
    let g:ayu#palette['dark']['accent']                  = '#E0A123'
else
    for style in ['light', 'mirage', 'dark']
        let g:ayu#palette[style]['extended_keyword_func'] = g:ayu#palette[style]['keyword']
        let g:ayu#palette[style]['extended_repeat']       = g:ayu#palette[style]['keyword']
        let g:ayu#palette[style]['extended_conditional']  = g:ayu#palette[style]['keyword']
        let g:ayu#palette[style]['import']                = g:ayu#palette[style]['accent']
    endfor
endif

function! ayu#get_style()
    return &background ==# 'dark' ? get(g:, 'ayucolor', 'dark') : &background
endfunction

function! ayu#get_color(color_name)
    let l:style = ayu#get_style()

    return g:ayu#palette[l:style][a:color_name]
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
