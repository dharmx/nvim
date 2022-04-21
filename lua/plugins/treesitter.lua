use { "danymat/neogen", after = "nvim-treesitter" }

use {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require "configs.treesitter"
  end,
  cmd = "TSUpdate",
}

use {
  "theHamsta/nvim-treesitter-commonlisp",
  after = "nvim-treesitter",
}

use {
  "RRethy/nvim-treesitter-textsubjects",
  after = "nvim-treesitter",
}

use {
  "andymass/vim-matchup",
  after = "nvim-treesitter",
}

use {
  "nvim-treesitter/nvim-treesitter-refactor",
  after = "nvim-treesitter",
}

use {
  "p00f/nvim-ts-rainbow",
  after = "nvim-treesitter",
}

use {
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
}

use {
  "nvim-treesitter/playground",
  after = "nvim-treesitter",
}

use {
  "windwp/nvim-ts-autotag",
  after = "nvim-treesitter",
}

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
  after = "nvim-treesitter",
  config = function()
    require "configs.treesitter.plugins.spellsitter"
  end,
}

-- vim:ft=lua
