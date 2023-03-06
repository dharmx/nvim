vim.cmd.colorscheme("fallback")

require("dharmx.core").setup()
require("dharmx.plug").setup({
  "simrat39/symbols-outline.nvim",
  "sheerun/vim-polyglot",
  "andweeb/presence.nvim",
  "rktjmp/paperplanes.nvim",
  "nvim-treesitter/nvim-tree-docs",
  "windwp/nvim-ts-autotag",
  "echasnovski/mini.indentscope",
  "nvim-tree/nvim-tree.lua",
  "hrsh7th/cmp-nvim-lua",
})
