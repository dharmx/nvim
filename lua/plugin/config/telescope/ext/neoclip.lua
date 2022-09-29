local present, neoclip = pcall(require, "neoclip")

if not present then
  return
end

local database_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3"

local config = {
  history = 5000,
  enable_persistent_history = true,
  db_path = database_path,
  preview = true,
  default_register = '"',
  default_register_macros = "q",
  enable_macro_history = true,
  content_spec_column = true,
  on_paste = { set_reg = false },
  on_replay = { set_reg = false },
  keys = {
    telescope = {
      i = {
        select = "<cr>",
        paste = "<c-p>",
        paste_behind = "<c-k>",
        replay = "<c-q>",
        custom = {},
      },
      n = {
        select = "<cr>",
        paste = "p",
        paste_behind = "P",
        replay = "q",
        custom = {},
      },
    },
    fzf = {
      select = "default",
      paste = "ctrl-p",
      paste_behind = "ctrl-k",
      custom = {},
    },
  },
}

neoclip.setup(config)

-- vim:ft=lua
