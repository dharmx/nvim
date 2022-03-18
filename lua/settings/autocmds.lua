local M = {}

M["AlphaTriggered"] = {
  {
    events = "VimEnter",
    command = require("utils.plugins").alpha_vimenter,
  },
  {
    events = "User",
    command = function()
      opt_local.laststatus = 0
      opt_local.showtabline = 0
    end,
    options = { patterns = "AlphaReady" },
  },
  {
    events = "BufUnload",
    command = function()
      opt_local.laststatus = 2
      opt_local.showtabline = 2
    end,
  },
}

M["AutoDisableTablineStatusline"] = {
  {
    events = "BufEnter",
    command = function()
      local blacklisted = require "tables.blacklisted"
      if vim.tbl_contains(blacklisted, api.nvim_buf_get_option(0, "ft")) then
        opt_local.laststatus = 0
        opt_local.showtabline = 0
      else
        opt_local.laststatus = 2
        opt_local.showtabline = 2
      end
    end,
  },
}

M["AutoPlugSpecCompileOnChange"] = {
  {
    events = "BufWritePost",
    command = schedule_wrap(function()
      require("packer").compile()
    end),
    options = { patterns = { "*/lua/plugins/*.lua", "*/lua/configs/workflow/nvimtree.lua" } },
  },
}

M["YankFeedback"] = {
  {
    events = "TextYankPost",
    command = function()
      vim.highlight.on_yank { higroup = "YankFeed", on_macro = true, on_visual = true, timeout = 150 }
    end,
  },
}

M["NativeAdjustments"] = {
  {
    events = { "TermOpen", "BufReadCmd" },
    command = function()
      opt_local.number = false
      opt_local.relativenumber = false
      opt_local.filetype = "terminal"
      require("utils.terminals")._TERM_KEYMAPS()
    end,
    options = { patterns = { "term://", "zsh", "*/zsh", "sh" } },
  },
  {
    events = "FileType",
    command = function()
      opt_local.formatoptions:remove "cro"
    end,
  },
}

M["ListCharsFeedback"] = {
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
}

M["RelativeFeedback"] = {
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
}

M["NumberFeedback"] = {
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
}

M["CursorLineFeedback"] = {
  {
    events = "InsertEnter",
    command = function()
      opt_local.cursorline = true
    end,
  },
  {
    events = "InsertLeave",
    command = function()
      opt_local.cursorline = false
    end,
  },
}

M["ScrollbarInit"] = {
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
}

M["NotifyOnPackerOperation"] = {
  {
    events = "User",
    command = function()
      notify {
        message = "Operation complete!",
        title = "packer.nvim",
        icon = "",
      }
    end,
    options = { patterns = "PackerComplete" },
  },
  {
    events = "User",
    command = function()
      notify {
        message = "Finished compiling!",
        title = "packer.nvim",
        icon = "",
      }
    end,
    options = { patterns = "PackerCompileDone" },
  },
}

M["PersistentFileEditPosition"] = {
  {
    events = "BufReadPost",
    command = [[if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
  },
}

M["NvimINCSearchCursorline"] = {
  {
    events = "CmdlineEnter",
    command = function()
      opt_local.cursorline = true
      opt_local.cursorcolumn = true
      opt_local.hlsearch = true
    end,
    options = { patterns = "/,\\?" },
  },
  {
    events = "CmdlineLeave",
    command = function()
      opt_local.cursorline = false
      opt_local.cursorcolumn = false
      opt_local.hlsearch = false
    end,
    options = { patterns = "/,\\?" },
  },
}

M["PersistentMarkdownFolds"] = {
  {
    events = "BufWinLeave",
    command = "mkview",
    options = { patterns = "*.md" },
  },
  {
    events = "BufWinEnter",
    command = "silent! loadview",
    options = { patterns = "*.md" },
  },
}

return M

-- vim:ft=lua
