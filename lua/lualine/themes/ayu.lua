local ayu_color = vim.fn['ayu#get_color']
local colors = {
  light_fg = ayu_color('editor_fg'),
  light_bg = ayu_color('ui_panel_bg'),
  dark_fg  = ayu_color('ui_fg'),
  dark_bg  = ayu_color('ui_panel_shadow'),
  purple   = ayu_color('syntax_constant'),
  green    = ayu_color('syntax_string'),
  blue     = ayu_color('syntax_entity'),
  red      = ayu_color('vcs_removed'),
  orange   = ayu_color('syntax_func'),
}

return {
  normal = {
    a = { fg = colors.light_bg, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.light_fg, bg = colors.dark_bg },
    c = { fg = colors.dark_fg,  bg = colors.light_bg },
  },
  insert = {
    a = { fg = colors.light_bg, bg = colors.green, gui = 'bold' },
    b = { fg = colors.light_fg, bg = colors.dark_bg },
  },
  visual = {
    a = { fg = colors.light_bg, bg = colors.purple, gui = 'bold' },
    b = { fg = colors.light_fg, bg = colors.dark_bg },
  },
  replace = {
    a = { fg = colors.light_bg, bg = colors.red, gui = 'bold' },
    b = { fg = colors.light_fg, bg = colors.dark_bg },
  },
  command = {
    a = { fg = colors.light_bg, bg = colors.orange, gui = 'bold' },
    b = { fg = colors.light_fg, bg = colors.dark_bg },
    c = { fg = colors.dark_fg,  bg = colors.light_bg },
  },
  inactive = {
    a = { fg = colors.light_fg, bg = colors.dark_bg, gui = 'bold' },
    b = { fg = colors.light_fg, bg = colors.dark_bg },
    c = { fg = colors.light_fg, bg = colors.light_bg },
  },
}
