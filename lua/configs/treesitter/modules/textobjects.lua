local maps = require("mappings").ts_textobjects

local M = {
  select = {
    enable = false,
    lookahead = true,
    keymaps = maps.select,
  },
  swap = {
    enable = false,
    swap_next = maps.swap.swap_next,
    swap_previous = maps.swap.swap_previous,
  },
  move = {
    enable = false,
    set_jumps = true,
    goto_next_start = maps.move.goto_next_start,
    goto_next_end = maps.move.goto_next_end,
    goto_previous_start = maps.move.goto_previous_start,
    goto_previous_end = maps.move.goto_previous_end,
  },
  lsp_interop = {
    enable = false,
    border = "rounded",
    peek_definition_code = maps.lsp_interop.peek_definition_code,
  },
}

return M

-- vim:ft=lua
