---@diagnostic disable: unused-local
local A = vim.api

vim.opt.statusline = ""
vim.opt.splitright = false
vim.opt.cmdheight = 0
vim.opt.showtabline = 1
vim.opt.number = false

local BANN = A.nvim_create_namespace("Bann")
local bannwin = A.nvim_get_current_win()
local bann = A.nvim_create_buf(false, false)
A.nvim_buf_set_option(bann, "filetype", "bann")
A.nvim_buf_set_option(bann, "modifiable", false)
A.nvim_win_set_buf(bannwin, bann)

vim.cmd.vsplit()
local SIDE = A.nvim_create_namespace("Side")
local sidewin = A.nvim_get_current_win()
local side = A.nvim_create_buf(false, false)
A.nvim_buf_set_option(side, "filetype", "side")
A.nvim_buf_set_option(side, "modifiable", false)
A.nvim_win_set_buf(sidewin, side)
A.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "side" then
      vim.opt_local.laststatus = 2
      return
    end
    vim.opt_local.laststatus = 0
  end
})
A.nvim_win_set_hl_ns(sidewin, SIDE)
A.nvim_set_hl(SIDE, "Normal", { background = "#151A1F" })

A.nvim_set_hl(0, "VertSplit", { foreground = "#151A1F", background = "#151A1F" })
A.nvim_set_hl(0, "StatusLine", { foreground = "#151A1F", background = "#151A1F" })
A.nvim_set_hl(0, "StatusLineNC", { foreground = "#101317", background = "#101317" })
