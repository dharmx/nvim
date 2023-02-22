local A = vim.api
local T = vim.treesitter
local locals = require("nvim-treesitter.locals")
local current_node = T.get_node_at_pos(0, unpack(A.nvim_win_get_cursor(0)))
local usage = locals.find_usage(current_node)

vim.pretty_print(usage)
