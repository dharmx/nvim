local ok, toggleterm = pcall(require, "toggleterm")
if not ok then return end

local config = {
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 0.2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "solid",
    winblend = 0,
  },
  highlights = {
    Normal = {
      link = "NormalFloat",
    },
    NormalFloat = {
      link = "NormalFloat",
    },
    FloatBorder = {
      link = "FloatBorder",
    },
  },
}

toggleterm.setup(config)

-- vim:filetype=lua
