return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("plugins.syntax.treesitter")
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
    config = function()
      require("plugins.syntax.context")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
    config = function()
      require("plugins.syntax.illuminate")
    end,
  },
  {
    "andymass/vim-matchup",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
}
