local M = {}

local function use(plugin)
  M[plugin[1]] = plugin
end

use { "tweekmonster/haunted.vim", cmd = "Haunt" }

use {
  "kevinhwang91/rnvimr",
  cmd = {
    "RnvimrToggle",
    "RnvimrResize",
  },
  setup = function()
    require "configs.workflow.rnvimr"
  end,
}

use {
  "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
  setup = require("configs.workflow.nvimtree").before,
  config = require("configs.workflow.nvimtree").after,
  wants = "nvim-notify",
}

use {
  "phaazon/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopChar1", "HopChar2", "HopPattern" },
  config = function()
    require "configs.workflow.hop"
  end,
}

use {
  "Pocco81/AutoSave.nvim",
  cmd = { "ASOn", "ASOff", "ASToggle" },
  config = function()
    require "configs.workflow.autosave"
  end,
}

use { "Shatur/neovim-session-manager", cmd = "SessionManager" }

use { "mbbill/undotree", cmd = "UndotreeToggle" }

use {
  "max397574/better-escape.nvim",
  config = function()
    require "configs.workflow.escape"
  end,
  keys = require("mappings").better_escape_nvim,
}

use { "abecodes/tabout.nvim", opt = true }

use { 
  "akinsho/toggleterm.nvim", 
  config = function()
    require("configs.workflow.toggleterm")
  end,
  cmd = { "ToggleTerm", "ToggleTermToggleAll" } 
}

use {
  "folke/which-key.nvim",
  config = function()
    require "configs.workflow.whichkey"
  end,
}

use { "ggandor/lightspeed.nvim", cmd = "LightSpeedInit" }

use {
  "bennypowers/nvim-regexplainer",
  config = function()
    require "configs.workflow.regexplainer"
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

return M

-- vim:ft=lua
