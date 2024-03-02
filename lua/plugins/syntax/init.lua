return {
  {
    "andymass/vim-matchup",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufWinEnter",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
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
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufWinEnter",
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
}
