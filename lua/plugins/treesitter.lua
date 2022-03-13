use { "danymat/neogen", wants = "nvim-treesitter", cmd = "Neogen" }

use {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require "configs.treesitter"
  end,
  wants = {
    "nvim-treesitter-refactor",
    "nvim-ts-rainbow",
    "nvim-treesitter-textobjects",
    "playground",
    "nvim-ts-autotag",
    "vim-matchup",
  },
  module = "configs.treesitter",
}

use { "nvim-treesitter/nvim-treesitter-refactor", opt = true }

use { "p00f/nvim-ts-rainbow", opt = true }

use { "nvim-treesitter/nvim-treesitter-textobjects", opt = true }

use { "nvim-treesitter/playground", opt = true }

use { "windwp/nvim-ts-autotag", opt = true }

use { "andymass/vim-matchup", cmd = "MatchupWhereAmI", wants = "nvim-treesitter" }

use {
  "romgrk/nvim-treesitter-context",
  after = "nvim-treesitter",
  config = function()
    require "configs.treesitter.plugins.context"
  end,
}

use {
  "SmiteshP/nvim-gps",
  after = "nvim-treesitter",
  config = function()
    require "configs.treesitter.plugins.gps"
  end,
}

use {
  "lewis6991/spellsitter.nvim",
  config = function()
    require "configs.treesitter.plugins.spellsitter"
  end,
  after = "nvim-treesitter",
}

-- vim:ft=lua
