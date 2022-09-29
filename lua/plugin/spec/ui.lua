--- NOTE: Adds and polishes neovim UI components. Such as tabline, indent lines, etc.
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "edluffy/specs.nvim",
  config = function()
    require("plugin.config.ui.specs")
  end,
  event = { "CursorMoved", "CursorMovedI" },
  disable = disabled["specs.nvim"],
})

use({
  "toppair/reach.nvim",
  config = function()
    require("plugin.config.ui.reach")
  end,
  module = "reach",
  disable = disabled["reach.nvim"],
})

use({
  "akinsho/bufferline.nvim",
  tag = "v2.*",
  event = "UIEnter",
  config = function()
    require("plugin.config.ui.bufferline")
  end,
  wants = "nvim-web-devicons",
  disable = disabled["bufferline.nvim"],
})

use({
  "kyazdani42/nvim-web-devicons",
  config = function()
    require("plugin.config.ui.devicons")
  end,
  module = "nvim-web-devicons",
  disable = disabled["nvim-web-devicons"],
})

use({
  "lukas-reineke/indent-blankline.nvim",
  cmd = {
    "IndentBlanklineEnable",
    "IndentBlanklineDisable",
    "IndentBlanklineToggle",
    "IndentBlanklineRefresh",
    "IndentBlanklineRefreshScroll",
  },
  config = function()
    require("plugin.config.ui.blankline")
  end,
  disable = disabled["indent-blankline.nvim"],
})

use({
  "VonHeikemen/fine-cmdline.nvim",
  cmd = "FineCmdline",
  config = function()
    require("plugin.config.ui.finecmdline")
  end,
  disable = disabled["fine-cmdline.nvim"],
})

use({
  "VonHeikemen/searchbox.nvim",
  cmd = {
    "SearchBoxIncSearch",
    "SearchBoxClear",
    "SearchBoxSimple",
    "SearchBoxReplace",
    "SearchBoxMatchAll",
  },
  config = function()
    require("plugin.config.ui.searchbox")
  end,
  disable = disabled["searchbox.nvim"],
})

use({
  "goolord/alpha-nvim",
  wants = "nvim-web-devicons",
  config = function()
    require("plugin.config.ui.alpha")
  end,
  cmd = {
    "Alpha",
    "AlphaRedraw",
  },
  disable = disabled["alpha-nvim"],
})

-- vim:ft=lua
