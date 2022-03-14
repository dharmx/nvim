local present, toggleterm = pcall(require, "toggleterm")

if not present then
  return
end

local config = {
  size = 20,
  open_mapping = require("mappings").toggleterm_nvim,
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

toggleterm.setup(config)

-- vim:ft=lua
