return {
  {
    enabled = false,
    "andymass/vim-matchup",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    enabled = false,
    "HiPhish/nvim-ts-rainbow2",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    enabled = false,
    "ckolkey/ts-node-action",
    config = true,
  },
  {
    enabled = false,
    "windwp/nvim-ts-autotag",
    event = "BufWinEnter",
  },
  {
    enabled = false,
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
    config = function()
      require("plugins.syntax.illuminate")
    end,
  },
  {
    enabled = false,
    "romgrk/nvim-treesitter-context",
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
    config = function()
      require("plugins.syntax.context")
    end,
  },
  {
    enabled = false,
    "sindrets/diffview.nvim",
    config = true,
    event = "CmdlineEnter",
  },
  {
    enabled = false,
    "TheBallsUp/lube.nvim",
    dev = true,
  },
  {
    enabled = false,
    "AndrewRadev/linediff.vim",
    cmd = "Linediff",
  },
  {
    enabled = false,
    "tpope/vim-repeat",
    event = { "CursorHold", "CursorMoved", "InsertEnter", "CmdlineEnter" },
  },
  {
    enabled = false,
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    opts = {
      auto_load = true,
      close_on_bdelete = true,
      syntax = true,
      theme = "dark",
      update_on_change = true,
      app = vim.env.BROWSER,
      filetype = { "markdown" },
      throttle_at = 200000,
      throttle_time = "auto",
    },
    ft = "markdown",
  },
}
