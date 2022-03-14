use { "tweekmonster/haunted.vim", cmd = "Haunt" }

use {
  "kevinhwang91/rnvimr",
  cmd = {
    "RnvimrToggle",
    "RnvimrResize",
  },
  setup = function()
    require "configs.rnvimr"
  end,
}

use {
  "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
  setup = require("configs.nvimtree").before,
  config = require("configs.nvimtree").after,
  wants = "nvim-notify",
}

use {
  "phaazon/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopChar1", "HopChar2", "HopPattern" },
  config = function()
    require "configs.hop"
  end,
}

use {
  "Pocco81/AutoSave.nvim",
  cmd = { "ASOn", "ASOff", "ASToggle" },
  config = function()
    require "configs.autosave"
  end,
}

use { "Shatur/neovim-session-manager", cmd = "SessionManager" }

use { "mbbill/undotree", cmd = "UndotreeToggle" }

use {
  "max397574/better-escape.nvim",
  config = function()
    require "configs.escape"
  end,
  keys = require("mappings").better_escape_nvim,
}

use { "abecodes/tabout.nvim", opt = true }

use { "akinsho/toggleterm.nvim", cmd = { "ToggleTerm", "ToggleTermToggleAll" } }

use {
  "folke/which-key.nvim",
  config = function()
    require "configs.whichkey"
  end,
}

use { "ggandor/lightspeed.nvim", cmd = "LightSpeedInit" }

use {
  "bennypowers/nvim-regexplainer",
  config = function()
    require "configs.regexplainer"
  end,
  after = "nvim-treesitter",
  wants = { "plenary.nvim", "nui.nvim" },
  cmd = {
    "RegexplainerHide",
    "RegexplainerShow",
    "RegexplainerShowPopup",
    "RegexplainerShowSplit",
  },
}

use { "winston0410/cmd-parser.nvim", event = "CmdlineEnter" }

use { "nvim-pack/nvim-spectre", opt = true }

-- vim:ft=lua
