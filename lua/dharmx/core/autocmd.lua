-- stylua: ignore start
local util = require("dharmx.util.nvim")
local autocmd = util.autocmd

autocmd({ "CursorHold", "CursorMoved", "CmdlineEnter", "TextChanged", "ModeChanged" }, ":silent! LspStart", { desc = "Lazy load LSP.", once = true })
autocmd("FileType", [[nnoremap <buffer><silent> q :quit<CR>]], { patterns = { "man" } })
autocmd("TextYankPost", function() vim.highlight.on_yank({ higroup = "Include", on_visual = true }) end, "Provide a visual color feedback on yanking.")

autocmd({ "TermOpen", "BufReadCmd" }, function()
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
end, { patterns = { "term://*", "zsh", "*/zsh", "sh", "bash", "toggleterm" }, desc = "Add terminal keymaps" })

-- stolen from https://github.com/jghauser/mkdir.nvim
autocmd("BufWritePre", function()
  local directory = vim.fn.expand('<afile>:p:h')
  if directory:find('%l+://') == 1 then return end
  if vim.fn.isdirectory(directory) == 0 then vim.fn.mkdir(directory, 'p') end
end)

-- autocmd("BufEnter", "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif", {
--   nested = true,
--   desc = "Auto-close NvimTree on opening a file",
-- })

-- autocmd("BufWinLeave", "mkview", {
--   patterns = "*.md",
--   desc = "Adds persistent window folding to the makrdown files.",
-- })

-- autocmd("BufWinEnter", "silent! loadview", {
--   patterns = "*.md",
--   desc = "Load the view silently when a new window is opened!",
-- })

-- stolen from nvchad
-- autocmd("BufReadPost", [[if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]], "Start editing from the point we left off.")

-- autocmd("InsertEnter", function()
--   vim.opt_local.listchars = { tab = " ", trail = "˽", space = "·", eol = "" }
-- end, "Show escape characters on Insert Mode.")
-- autocmd("InsertLeave", function() vim.opt_local.listchars = {} end, "Hide escape characters on leaving the Insert Mode.")

-- vim:filetype=lua
