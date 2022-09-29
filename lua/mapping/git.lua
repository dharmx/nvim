local M = {}

M.mappings = {
  ["name"] = " Git",
  ["j"] = {
    "<CMD>lua require 'gitsigns'.next_hunk()<CR>",
    " Next Hunk",
  },
  ["k"] = {
    "<CMD>lua require 'gitsigns'.prev_hunk()<CR>",
    " Prev Hunk",
  },
  ["l"] = {
    "<CMD>lua require 'gitsigns'.blame_line()<CR>",
    " Blame",
  },
  ["p"] = {
    "<CMD>lua require 'gitsigns'.preview_hunk()<CR>",
    " review Hunk",
  },
  ["r"] = {
    "<CMD>lua require 'gitsigns'.reset_hunk()<CR>",
    "ﰇ Reset Hunk",
  },
  ["R"] = {
    "<CMD>lua require 'gitsigns'.reset_buffer()<CR>",
    " Reset Buffer",
  },
  ["s"] = {
    "<CMD>lua require 'gitsigns'.stage_hunk()<CR>",
    "ﴽ Stage Hunk",
  },
  ["u"] = {
    "<CMD>lua require 'gitsigns'.undo_stage_hunk()<CR>",
    " Undo Stage Hunk",
  },
  ["h"] = {
    "<CMD>GitHL<CR>",
    " Highlight number column",
  },
  ["d"] = {
    "<CMD>Gitsigns diffthis HEAD<CR>",
    " Diff",
  },
  ["L"] = {
    "<CMD>lua require('utils.term')._LAZYGIT_TOGGLE()<CR>",
    " Lazygit",
  },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  prefix = "<leader><leader>",
  nowait = false,
}

return M

-- vim:ft=lua
