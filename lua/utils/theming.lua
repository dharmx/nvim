--- Theming related utility functions

local M = {}

--- Returns the current theme colors.
-- @return table of highlight groups and their color values
function M.get_active_theme()
  return require("theming.themes." .. theme)
end

--- Applies highlight to a group. Creates the group if it doesn't exists.
-- @see help highlight-{guifg,guibg,gui,guisp,link,args,groups}
function M.highlight(group, colors)
  if colors.link then
    vim.api.nvim_set_hl(0, group, { link = colors.link })
    return
  end
  colors = vim.tbl_extend("keep", colors, {
    fg = "NONE",
    bg = "NONE",
  })
  vim.api.nvim_set_hl(0, group, colors)
end

return M

-- vim:ft=lua
