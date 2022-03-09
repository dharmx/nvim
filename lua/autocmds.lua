local augroups = {
  ["OpenDashboardOnBlankBuffer"] = {
    {
      events = "VimEnter",
      command = function()
        utils.dashboard_vimenter()
      end,
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
        opt_local.listchars = {
          tab = " ",
          trail = "˽",
          space = "·",
          eol = "↴",
        }
      end,
    },
    {
      events = "InsertLeave",
      command = function()
        opt_local.listchars = ""
      end,
    },
  },
  ["RelativeFeedback"] = {
    {
      events = "InsertEnter",
      command = function()
        opt_local.relativenumber = true
      end,
    },
    {
      events = "InsertLeave",
      command = function()
        opt_local.relativenumber = false
      end,
    },
  },
  ["NumberFeedback"] = {
    {
      events = "InsertEnter",
      command = function()
        opt_local.number = true
      end,
    },
    {
      events = "InsertLeave",
      command = function()
        opt_local.number = false
      end,
    },
  },
  ["CursorLineFeedback"] = {
    {
      events = { "BufEnter", "WinEnter", "InsertEnter" },
      command = function()
        opt_local.cursorline = true
      end,
    },
    {
      events = { "BufEnter", "WinEnter", "InsertLeave" },
      command = function()
        opt_local.cursorline = false
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
  augroup(name, augroups[name])
end

-- vim:ft=lua
