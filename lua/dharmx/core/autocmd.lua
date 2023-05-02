-- stylua: ignore start
local util = require("dharmx.util").nvim
local on = util.on

on("TextYankPost", function() vim.highlight.on_yank({ higroup = "Include", on_visual = true }) end, "Provide a visual color feedback on yanking.")

on({ "TermOpen", "BufReadCmd" }, function()
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
end, { patterns = { "term://*", "zsh", "*/zsh", "sh", "bash", "toggleterm" }, desc = "Add terminal keymaps" })

on("BufWritePre", function()
  local directory = vim.fn.expand('<afile>:p:h')
  if directory:find('%l+://') == 1 then return end
  if vim.fn.isdirectory(directory) == 0 then vim.fn.mkdir(directory, 'p') end
end)

-- on("BufEnter", "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif", {
--   nested = true,
--   desc = "Auto-close NvimTree on opening a file",
-- })

-- on("BufWinLeave", "mkview", {
--   patterns = "*.md",
--   desc = "Adds persistent window folding to the makrdown files.",
-- })

-- on("BufWinEnter", "silent! loadview", {
--   patterns = "*.md",
--   desc = "Load the view silently when a new window is opened!",
-- })

-- on("InsertEnter", function()
--   vim.opt_local.listchars = { tab = " ", trail = "˽", space = "·", eol = "" }
-- end, "Show escape characters on Insert Mode.")
-- on("InsertLeave", function() vim.opt_local.listchars = {} end, "Hide escape characters on leaving the Insert Mode.")
