local M = {
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    },
  },
  swap = {
    enable = true,
    swap_next = { ["<leader>a"] = "@parameter.inner" },
    swap_previous = { ["<leader>A"] = "@parameter.inner" },
  },
  move = {
    enable = true,
    set_jumps = true,
    goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
    goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
  },
  lsp_interop = {
    enable = true,
    border = "soild",
    peek_definition_code = {
      ["<leader>df"] = "@function.outer",
      ["<leader>dF"] = "@class.outer",
    },
  },
}

return M

-- vim:ft=lua
