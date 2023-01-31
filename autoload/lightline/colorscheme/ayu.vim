let s:style = ayu#get_style()

let s:fg = {}
let s:fg.light = ayu#get_color('editor_fg')
let s:fg.dark = ayu#get_color('ui_fg')
let s:fg.warning = ayu#get_color('extended_warning')
let s:fg.error = ayu#get_color('common_error')

let s:bg = {}
let s:bg.light = ayu#get_color('ui_panel_bg')
let s:bg.dark = ayu#get_color('ui_panel_shadow')
let s:bg.contrast = ayu#get_color('common_accent')
let s:bg.normal = ayu#get_color('syntax_entity')
let s:bg.insert = ayu#get_color('syntax_string')
let s:bg.replace = ayu#get_color('vcs_removed')
let s:bg.visual = ayu#get_color('syntax_constant')
let s:bg.command = ayu#get_color('syntax_func')

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'command': {}, 'tabline': {}}

let s:p.normal.left     = [[s:bg.light, s:bg.normal], [s:fg.light, s:bg.dark]]
let s:p.normal.right    = [[s:fg.light, s:bg.dark], [s:fg.light, s:bg.dark]]
let s:p.normal.middle   = [[s:fg.dark, s:bg.light]]
let s:p.normal.error    = [[s:fg.error, s:bg.dark, 'bold']]
let s:p.normal.warning  = [[s:fg.warning, s:bg.dark, 'bold']]

let s:p.inactive.left   = [[s:fg.light, s:bg.dark]]
let s:p.inactive.right  = [[s:fg.light, s:bg.dark]]
let s:p.inactive.middle = [[s:fg.light, s:bg.light]]

let s:p.insert.left     = [[s:bg.light, s:bg.insert], [s:fg.light, s:bg.dark]]

let s:p.replace.left    = [[s:bg.light, s:bg.replace], [s:fg.light, s:bg.dark]]

let s:p.visual.left     = [[s:bg.light, s:bg.visual], [s:fg.light, s:bg.dark]]

let s:p.command.left     = [[s:bg.light, s:bg.command, 'bold'], [s:fg.light, s:bg.dark]]

let s:p.tabline.left    = [[s:fg.dark, s:bg.light]]
let s:p.tabline.tabsel  = [[s:fg.light, s:bg.dark]]

let g:lightline#colorscheme#ayu#palette = lightline#colorscheme#fill(s:p)
