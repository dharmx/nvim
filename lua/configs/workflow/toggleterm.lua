local present, toggleterm = pcall(require, "toggleterm")

if not present then
  return
end

local config = {
  open_mapping = require("mappings").toggleterm_nvim.open_mapping,
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 0.2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "solid",
    highlights = {
      border = "FloatBorder",
      background = "NormalFloat",
    },
  },
}

toggleterm.setup(config)

-- vim:ft=lua
