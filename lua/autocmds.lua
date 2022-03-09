local util = require "utils"
local autocmd = util.autocmd
local cmd = vim.api.nvim_command

cmd "cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))"
cmd "cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))"
cmd "cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))"
cmd "cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))"
cmd "cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q!'):('q'))"
cmd "cnoreabbrev <expr> q ((getcmdtype() is# ':' && getcmdline() is# 'q')?('q!'):('q'))"

local augroups = {
  ["OpenDashboardOnBlankBuffer"] = {
    {
      events = "VimEnter",
      command = function()
        util.dashboard_vimenter()
      end,
      options = { patterns = "*/lua/plugins.lua" },
    },
  },
  ["AutoPlugSpecCompileOnChange"] = {
    {
      events = "BufWritePost",
      command = function()
        require("packer").compile()
      end,
      options = { patterns = "*/lua/plugins.lua" },
    },
  },
  ["YankFeedback"] = {
    {
      events = "TextYankPost",
      command = function()
        vim.highlight.on_yank { higroup = "YankFeed", timeout = 150 }
      end,
    },
  },
  ["NativeAdjustments"] = {
    {
      events = "TermOpen",
      command = "setlocal nonumber norelativenumber | setfiletype terminal",
      options = { patterns = "term://" },
    },
    {
      events = "FileType",
      command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
    },
    {
      events = "BufReadPost",
      command = "let &l:modifiable = !&readonly",
    },
  },
  ["ListCharsFeedback"] = {
    {
      events = "InsertEnter",
      command = function()
        vim.opt_local.listchars = {
          tab = " ",
          trail = "·",
          space = "⋅",
          eol = "↴",
        }
      end,
    },
    {
      events = "InsertLeave",
      command = function()
        vim.opt_local.listchars = ""
      end,
    },
  },
  ["RelativeFeedback"] = {
    {
      events = "InsertEnter",
      command = function()
        vim.opt_local.relativenumber = true
      end,
    },
    {
      events = "InsertLeave",
      command = function()
        vim.opt_local.relativenumber = false
      end,
    },
  },
  ["NumberFeedback"] = {
    {
      events = "InsertEnter",
      command = function()
        vim.opt_local.number = true
      end,
    },
    {
      events = "InsertLeave",
      command = function()
        vim.opt_local.number = false
      end,
    },
  },
  ["CursorLineFeedback"] = {
    {
      events = { "BufEnter", "WinEnter", "InsertEnter" },
      command = function()
        vim.opt_local.cursorline = true
      end,
    },
    {
      events = { "BufEnter", "WinEnter", "InsertLeave" },
      command = function()
        vim.opt_local.cursorline = false
      end,
    },
  },
  ["ScrollbarInit"] = {
    {
      events = { "WinEnter", "FocusGained", "WinScrolled", "VimResized", "QuitPre" },
      command = function()
        require("scrollbar").show()
      end,
    },
    {
      events = { "WinLeave", "BufLeave", "BufWinLeave", "FocusLost" },
      command = function()
        require("scrollbar").clear()
      end,
    },
  },
}

for _, name in
  ipairs {
    "NativeAdjustments",
    "OpenDashboardOnBlankBuffer",
    "AutoPlugSpecCompileOnChange",
    "YankFeedback",
  }
do
  util.augroup(name, augroups[name])
end

-- vim:ft=lua
