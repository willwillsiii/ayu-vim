
return {
  rainbow_colors = function()
    -- local style = vim.fn['ayu#get_style']()
    -- local style = vim.o.background ~= 'dark'
    local style = 'mirage'
    if style == 'light' then
      return {
        '#F0D5AF',
        '#E6BA7E',
        '#B89565',
        '#8A704C'
      }
    elseif style == 'mirage' then
      return {
        '#FFF9EC',
        '#FFE6B3',
        '#FFCA5A',
        '#FFAE00',
      }
    elseif style == 'dark' then
      return {
        '#F0D2A8',
        '#E6B673',
        '#B8915C',
        '#8A7D45',
      }
    end
    return nil
  end,
}
