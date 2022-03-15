local M = {}

M["OpenDashboardOnBlankBuffer"] = {
  {
    events = "VimEnter",
    command = function()
      utils.dashboard_vimenter()
    end,
  },
}

M["AutoPlugSpecCompileOnChange"] = {
  {
    events = "BufWritePost",
    command = function()
      require("packer").compile()
    end,
    options = { patterns = "*/lua/plugins/*.lua" },
  },
}

M["YankFeedback"] = {
  {
    events = "TextYankPost",
    command = function()
      vim.highlight.on_yank { higroup = "YankFeed", timeout = 150 }
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
      require("utils.toggleterm")._TERM_KEYMAPS()
    end,
    options = { patterns = { "term://", "zsh", "*/zsh" } },
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
