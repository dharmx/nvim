-- stylua: ignore start
local util = require("dharmx.util.nvim")
local aucmd = util.aucmd

-- aucmd("BufWritePost", function()
--   local makefile = vim.loop.cwd() .. "/Makefile"
--   local Task = require("plenary.job")
--   vim.loop.fs_stat(makefile, vim.schedule_wrap(function(errors, _)
--     if errors then return end
--     local task = Task:new({ command = "make", args = vim.g.automake })
--     task:after_success(vim.schedule_wrap(function()
--       vim.api.nvim_notify("Recompiled!", vim.log.levels.INFO, { title = "Automake.", icon = "לּ " })
--     end))
--     task:after_failure(vim.schedule_wrap(function()
--       vim.api.nvim_notify("Failure!", vim.log.levels.WARN, { title = "Automake.", icon = " " })
--     end))
--     task:start()
--   end))
-- end)

-- aucmd({ "CursorHold", "CursorMoved", "CmdlineEnter", "TextChanged", "ModeChanged" }, ":silent! LspStart", { desc = "Lazy load LSP.", once = true })
aucmd("FileType", function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "help", "alpha" }, filetype) then
    local callback = vim.cmd.quit
    if filetype == "alpha" then callback = vim.cmd.Alpha end
    vim.keymap.set("n", "q", callback, { silent = true, buffer = vim.api.nvim_get_current_buf() })
  end
end)
aucmd("TextYankPost", function() vim.highlight.on_yank({ higroup = "Include", on_visual = true }) end, "Provide a visual color feedback on yanking.")

aucmd({ "TermOpen", "BufReadCmd" }, function()
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
end, { patterns = { "term://*", "zsh", "*/zsh", "sh", "bash", "toggleterm" }, desc = "Add terminal keymaps" })

-- stolen from https://github.com/jghauser/mkdir.nvim
aucmd("BufWritePre", function()
  local directory = vim.fn.expand('<afile>:p:h')
  if directory:find('%l+://') == 1 then return end
  if vim.fn.isdirectory(directory) == 0 then vim.fn.mkdir(directory, 'p') end
end)

-- aucmd("BufEnter", "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif", {
--   nested = true,
--   desc = "Auto-close NvimTree on opening a file",
-- })

-- aucmd("BufWinLeave", "mkview", {
--   patterns = "*.md",
--   desc = "Adds persistent window folding to the makrdown files.",
-- })

-- aucmd("BufWinEnter", "silent! loadview", {
--   patterns = "*.md",
--   desc = "Load the view silently when a new window is opened!",
-- })

-- stolen from nvchad
-- aucmd("BufReadPost", [[if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]], "Start editing from the point we left off.")

-- aucmd("InsertEnter", function()
--   vim.opt_local.listchars = { tab = " ", trail = "˽", space = "·", eol = "" }
-- end, "Show escape characters on Insert Mode.")
-- aucmd("InsertLeave", function() vim.opt_local.listchars = {} end, "Hide escape characters on leaving the Insert Mode.")

-- vim:filetype=lua
