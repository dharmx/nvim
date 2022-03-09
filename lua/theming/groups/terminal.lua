local T = {}

function T.set(theme)
  vim.g.terminal_color_0 = theme.common.base01
  vim.g.terminal_color_1 = theme.common.base11
  vim.g.terminal_color_2 = theme.common.base14
  vim.g.terminal_color_3 = theme.common.base13
  vim.g.terminal_color_4 = theme.common.base09
  vim.g.terminal_color_5 = theme.common.base15
  vim.g.terminal_color_6 = theme.common.base08
  vim.g.terminal_color_7 = theme.common.base05
  vim.g.terminal_color_8 = theme.common.base03
  vim.g.terminal_color_9 = theme.common.base11
  vim.g.terminal_color_10 = theme.common.base14
  vim.g.terminal_color_11 = theme.common.base13
  vim.g.terminal_color_12 = theme.common.base09
  vim.g.terminal_color_13 = theme.common.base15
  vim.g.terminal_color_14 = theme.common.base07
  vim.g.terminal_color_15 = theme.common.base06
end

return T

-- vim:ft=vim
