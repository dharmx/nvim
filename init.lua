vim.cmd.colorscheme("fallback")

require("dharmx.core").exclude()
require("dharmx.plug").exclude({
  "simrat39/symbols-outline.nvim",
  "sheerun/vim-polyglot",
  "andweeb/presence.nvim",
  "nvim-treesitter/nvim-tree-docs",
  "windwp/nvim-ts-autotag",
  "echasnovski/mini.indentscope",
  "kyazdani42/nvim-tree.lua",
  "hrsh7th/cmp-nvim-lua",
  "RRethy/vim-illuminate",
})

require("scratch.node").setup({
  cmd = true,
  heavy = true,
  map = { enable = true },
})

-- vim:filetype=lua
