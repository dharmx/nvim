local M = {}

M["ReplaceModes"] = {
  {
    events = { "BufEnter", "FileType" },
    command = function()
      require("utils.mappings").cmdline_override(true)
    end,
    options = {
      desc = "Adds mappings specific to fine-cmdline.nvim",
      patterns = "cmdline",
    },
  },
  {
    events = { "BufEnter", "FileType" },
    command = function()
      require("utils.mappings").search_override()
    end,
    options = {
      desc = "Adds mappings specific to searchbox.nvim",
      patterns = "search",
    },
  },
}

M["AlphaTriggered"] = {
  {
    events = "VimEnter",
    command = require("utils.plugins").alpha_vimenter,
    options = {
      desc = "Open Startpage on opening Neovim without any filename.",
    },
  },
  {
    events = "User",
    command = function()
      opt_local.showtabline = 0
      opt_local.laststatus = 0
    end,
    options = {
      patterns = "AlphaReady",
      desc = "Hide tabline and statusline when the startpage is visible.",
    },
  },
  {
    events = "BufUnload",
    command = function()
      opt_local.showtabline = 2
      opt_local.laststatus = 3
    end,
    options = {
      desc = "Show the tabline and the statusline when a file is opened.",
    },
  },
}

M["AutoDisableTablineStatusline"] = {
  {
    events = "BufEnter",
    command = function()
      local invisible = require("tables.blacklisted").invisible
      if vim.tbl_contains(invisible, api.nvim_buf_get_option(0, "ft")) then
        opt_local.laststatus = 0
        opt_local.showtabline = 0
      else
        opt_local.laststatus = 3
        opt_local.showtabline = 2
      end
    end,
    options = {
      desc = "Don't show the statusline on the specified filetypes.",
    },
  },
}

M["AutoPlugSpecCompileOnChange"] = {
  {
    events = "BufWritePost",
    command = schedule_wrap(function()
      require("packer").compile()
    end),
    options = {
      patterns = {
        "*/lua/plugins/*.lua",
        "*/lua/configs/workflow/nvimtree.lua",
      },
      desc = "Automatically re-compile plugin specifications on changing the matched pattern files.",
    },
  },
}

M["YankFeedback"] = {
  {
    events = "TextYankPost",
    command = function()
      vim.highlight.on_yank {
        higroup = "YankFeed",
        on_macro = true,
        on_visual = true,
        timeout = 150,
      }
    end,
    options = { desc = "Provide a visual color feedback on yanking." },
  },
}

M["NativeAdjustments"] = {
  {
    events = { "TermOpen", "BufReadCmd" },
    command = function()
      opt_local.number = false
      opt_local.relativenumber = false
      require("utils.terminals")._TERM_KEYMAPS()
    end,
    options = {
      patterns = { "term://*", "zsh", "*/zsh", "sh", "bash", "toggleterm" },
      desc = "Add convenience terminal keymaps for getting out of a terminal easily, for instance.",
    },
  },
  {
    events = "FileType",
    command = function()
      opt_local.formatoptions:remove { "c", "r", "o" }
    end,
    options = { desc = "Removes comment continuations from every file." },
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
    options = { desc = "Show escape characters on Insert Mode." },
  },
  {
    events = "InsertLeave",
    command = function()
      opt_local.listchars = ""
    end,
    options = { desc = "Hide escape characters on leaving the Insert Mode." },
  },
}

M["RelativeFeedback"] = {
  {
    events = "InsertEnter",
    command = function()
      opt_local.relativenumber = true
    end,
    options = { desc = "Show relative number column in Insert Mode." },
  },
  {
    events = "InsertLeave",
    command = function()
      opt_local.relativenumber = false
    end,
    options = {
      desc = "Hide relative number column when leaving Insert Mode.",
    },
  },
}

M["NumberFeedback"] = {
  {
    events = "InsertEnter",
    command = function()
      opt_local.number = true
    end,
    options = { desc = "Show number column on Insert Mode." },
  },
  {
    events = "InsertLeave",
    command = function()
      opt_local.number = false
    end,
    options = { desc = "Hide number column when leaving Insert Mode." },
  },
}

M["CursorLineFeedback"] = {
  {
    events = "InsertEnter",
    command = function()
      opt_local.cursorline = true
    end,
    options = { desc = "Show cursorline in Insert Mode." },
  },
  {
    events = "InsertLeave",
    command = function()
      opt_local.cursorline = false
    end,
    options = { desc = "Show cursorline in Insert Mode." },
  },
}

M["ScrollbarInit"] = {
  {
    events = {
      "WinEnter",
      "FocusGained",
      "WinScrolled",
      "VimResized",
      "QuitPre",
    },
    command = function()
      require("scrollbar").show()
    end,
    options = { desc = "Show scrollbar when foucsed and when scrolled." },
  },
  {
    events = { "WinLeave", "BufLeave", "BufWinLeave", "FocusLost" },
    command = function()
      require("scrollbar").clear()
    end,
    options = {
      desc = "Remove scrollbar when not foucsed or, leaving the current window/buffer.",
    },
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
    options = {
      patterns = "PackerComplete",
      desc = "Show a notification when any packer operation is complete. For example a notification with the title 'Finised compiled!' will be shot when Compiling plugin specifications are finished!",
    },
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
    options = {
      patterns = "PackerCompileDone",
      options = {
        desc = "Show a notification when any packer operation is complete!",
      },
    },
  },
}

M["PersistentFileEditPosition"] = {
  {
    events = "BufReadPost",
    command = [[if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
    options = {
      desc = "Start editing from the point we left off.",
    },
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
    options = {
      patterns = "/,\\?",
      desc = "Add column-cursorline and cursorline values and search value",
    },
  },
  {
    events = "CmdlineLeave",
    command = function()
      opt_local.cursorline = false
      opt_local.cursorcolumn = false
      opt_local.hlsearch = false
    end,
    options = {
      desc = "Remove column-cursorline and cursorline values and search value",
      patterns = "/,\\?",
    },
  },
}

M["PersistentMarkdownFolds"] = {
  {
    events = "BufWinLeave",
    command = "mkview",
    options = {
      patterns = "*.md",
      desc = "Adds persistent window folding to the makrdown files.",
    },
  },
  {
    events = "BufWinEnter",
    command = "silent! loadview",
    options = {
      patterns = "*.md",
      desc = "Load the view silently when a new window is opened!",
    },
  },
}

return M

-- vim:ft=lua
