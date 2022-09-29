--- NOTE: This file contains treesitter related plugins.
--- NOTE: Their extensions and modules.
local use = require("packer").use

local disabled = require("control.disabled")

use({ "danymat/neogen", after = "nvim-treesitter", disable = disabled["neogen"] })

use({
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("plugin.config.treesitter")
  end,
  cmd = "TSUpdate",
  disable = disabled["nvim-treesitter"],
})

use({
  "theHamsta/nvim-treesitter-commonlisp",
  after = "nvim-treesitter",
  disable = disabled["nvim-treesitter-commonlisp"],
})

use({
  "RRethy/nvim-treesitter-textsubjects",
  after = "nvim-treesitter",
  disable = disabled["nvim-treesitter-textsubjects"],
})

use({
  "andymass/vim-matchup",
  disable = disabled["vim-matchup"],
  after = "nvim-treesitter",
})

use({
  "nvim-treesitter/nvim-treesitter-refactor",
  after = "nvim-treesitter",
  disable = disabled["nvim-treesitter-refactor"],
})

use({
  "p00f/nvim-ts-rainbow",
  after = "nvim-treesitter",
  disable = disabled["nvim-ts-rainbow"],
})

use({
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
  disable = disabled["nvim-treesitter-textobjects"],
})

use({
  "nvim-treesitter/playground",
  after = "nvim-treesitter",
  disable = disabled["playground"],
})

use({
  "windwp/nvim-ts-autotag",
  after = "nvim-treesitter",
  disable = disabled["nvim-ts-autotag"],
})

use({
  "romgrk/nvim-treesitter-context",
  after = "nvim-treesitter",
  config = function()
    require("plugin.config.treesitter.plugins.context")
  end,
  disable = disabled["nvim-treesitter-context"],
})

use({
  "SmiteshP/nvim-gps",
  after = "nvim-treesitter",
  config = function()
    require("plugin.config.treesitter.plugins.gps")
  end,
  disable = disabled["nvim-gps"],
})

use({
  "lewis6991/spellsitter.nvim",
  after = "nvim-treesitter",
  config = function()
    require("plugin.config.treesitter.plugins.spellsitter")
  end,
  disable = disabled["spellsitter.nvim"],
})

-- vim:ft=lua
