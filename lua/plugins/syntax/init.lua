return {
  {
    "andymass/vim-matchup",
    enabled = false,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    enabled = false,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "ckolkey/ts-node-action",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufWinEnter",
    enabled = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
    enabled = false,
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
    enabled = false,
    config = function()
      require("plugins.syntax.context")
    end,
  },
}
