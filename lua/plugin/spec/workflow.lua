--- NOTE: This group assists workflow such as efficient motion control, jumps, searches,
--- NOTE: bookmarks, auto-save, file explorer, etc.
local use = require("packer").use

local disabled = require("control.disabled")

use({ "tweekmonster/haunted.vim", cmd = "Haunt", disable = disabled["haunted.vim"] })

use({
  "MattesGroeger/vim-bookmarks",
  setup = function()
    require("plugin.config.workflow.bookmarks")
  end,
  cmd = "BookmarkToggle",
  event = {
    "InsertEnter",
    "CmdlineEnter",
    "CursorMoved",
  },
  disable = disabled["vim-bookmarks"],
})

use({
  "tjdevries/train.nvim",
  cmd = {
    "TrainUpDown",
    "TrainWord",
    "TrainTextObj",
  },
  disable = disabled["train.nvim"],
})

use({
  "kevinhwang91/rnvimr",
  cmd = {
    "RnvimrToggle",
    "RnvimrResize",
  },
  setup = function()
    require("plugin.config.workflow.rnvimr")
  end,
  disable = disabled["rnvimr"],
})

use({
  "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
  config = function()
    require("plugin.config.workflow.nvimtree")
  end,
  disable = disabled["nvim-tree.lua"],
})

use({
  "phaazon/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopChar1", "HopChar2", "HopPattern" },
  config = function()
    require("plugin.config.workflow.hop")
  end,
  disable = disabled["hop.nvim"],
})

use({
  "Pocco81/AutoSave.nvim",
  cmd = { "ASOn", "ASOff", "ASToggle" },
  config = function()
    require("plugin.config.workflow.autosave")
  end,
  disable = disabled["AutoSave.nvim"],
})

use({ "Shatur/neovim-session-manager", cmd = "SessionManager", disable = disabled["neovim-session-manager"] })

use({
  "mbbill/undotree",
  disable = disabled["undotree"],
  cmd = "UndotreeToggle",
  config = function()
    require("plugin.config.workflow.undotree")
  end,
})

use({
  "max397574/better-escape.nvim",
  config = function()
    require("plugin.config.workflow.escape")
  end,
  event = "InsertLeave",
  disable = disabled["better-escape.nvim"],
})

use({ "abecodes/tabout.nvim", opt = true, disable = disabled["tabout.nvim"] })

use({
  "akinsho/toggleterm.nvim",
  disable = disabled["toggleterm.nvim"],
  config = function()
    require("plugin.config.workflow.toggleterm")
  end,
  module = { "toggleterm" },
  cmd = { "ToggleTerm", "ToggleTermToggleAll" },
})

use({
  "folke/which-key.nvim",
  event = "UIEnter",
  disable = disabled["which-key.nvim"],
  config = function()
    require("plugin.config.workflow.whichkey")
  end,
})

use({
  "ggandor/lightspeed.nvim",
  opt = true,
  disable = disabled["lightspeed.nvim"],
})

use({ "ggandor/leap.nvim", opt = true, disable = disabled["leap.nvim"] })

use({
  "bennypowers/nvim-regexplainer",
  config = function()
    require("plugin.config.workflow.regexplainer")
  end,
  wants = "nui.nvim",
  after = "nvim-treesitter",
  disable = disabled["nvim-regexplainer"],
})

use({
  "winston0410/cmd-parser.nvim",
  event = "CmdlineEnter",
  disable = disabled["cmd-parser.nvim"],
})

-- vim:ft=lua
