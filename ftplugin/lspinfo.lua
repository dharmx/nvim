vim.opt_local.winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel"
local window = vim.api.nvim_get_current_win()
local config = vim.api.nvim_win_get_config(window)
config.border = "solid"
vim.api.nvim_win_set_config(window, config)
