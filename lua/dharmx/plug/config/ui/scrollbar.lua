local ok, scrollbar = pcall(require, "scrollbar")
if not ok then return end
local MainConfig = require("dharmx")

scrollbar.setup({
  show = true,
  show_in_active_only = false,
  set_highlights = false,
  folds = 1000,
  max_lines = false,
  handle = {
    text = " ",
    hide_if_all_visible = true,
  },
  marks = {
    Search = {
      text = MainConfig.ui.scrollbar.Search,
      priority = 0,
    },
    Error = {
      text = MainConfig.ui.scrollbar.Error,
      priority = 1,
    },
    Warn = {
      text = MainConfig.ui.scrollbar.Warn,
      priority = 2,
    },
    Info = {
      text = MainConfig.ui.scrollbar.Info,
      priority = 3,
    },
    Hint = {
      text = MainConfig.ui.scrollbar.Hint,
      priority = 4,
    },
    Misc = {
      text = MainConfig.ui.scrollbar.Misc,
      priority = 5,
    },
    GitAdd = {
      text = MainConfig.ui.scrollbar.GitAdd,
      priority = 5,
    },
    GitChange = {
      text = MainConfig.ui.scrollbar.Change,
      priority = 5,
    },
    GitDelete = {
      text = MainConfig.ui.scrollbar.Delete,
      priority = 5,
    },
  },
  excluded_buftypes = MainConfig.black.buftype,
  excluded_filetypes = MainConfig.black.filetype,
  autocmd = {
    render = {
      "BufWinEnter",
      "TabEnter",
      "TermEnter",
      "WinEnter",
      "CmdwinLeave",
      "TextChanged",
      "VimResized",
      "WinScrolled",
    },
    clear = {
      "BufWinLeave",
      "TabLeave",
      "TermLeave",
      "WinLeave",
    },
  },
  handlers = {
    diagnostic = true,
    search = true,
    gitsigns = true,
  },
})

-- vim:filetype=lua
