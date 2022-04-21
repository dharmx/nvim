use {
  "edluffy/specs.nvim",
  config = function()
    require "configs.ui.specs"
  end,
  event = { "CursorMoved", "CursorMovedI" },
}

use {
  "toppair/reach.nvim",
  config = function()
    require "configs.ui.reach"
  end,
  module = "reach",
}

use {
  "akinsho/bufferline.nvim",
  commit = "0a83c615a8ab49718d9b4cdc60127003307829b2",
  config = function()
    require "configs.ui.bufferline"
  end,
  wants = "nvim-web-devicons",
}

use {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require "configs.ui.devicons"
  end,
  module = "nvim-web-devicons",
}

use {
  "lukas-reineke/indent-blankline.nvim",
  cmd = {
    "IndentBlanklineEnable",
    "IndentBlanklineDisable",
    "IndentBlanklineToggle",
    "IndentBlanklineRefresh",
    "IndentBlanklineRefreshScroll",
  },
  config = function()
    require "configs.ui.blankline"
  end,
}

use {
  "VonHeikemen/fine-cmdline.nvim",
  cmd = "FineCmdline",
  config = function()
    require "configs.ui.finecmdline"
  end,
}

use {
  "VonHeikemen/searchbox.nvim",
  cmd = {
    "SearchBoxIncSearch",
    "SearchBoxClear",
    "SearchBoxSimple",
    "SearchBoxReplace",
    "SearchBoxMatchAll",
  },
  config = function()
    require "configs.ui.searchbox"
  end,
}

use {
  "goolord/alpha-nvim",
  wants = "nvim-web-devicons",
  config = function()
    require "configs.ui.alpha"
  end,
  cmd = {
    "Alpha",
    "AlphaRedraw",
  },
}

-- vim:ft=lua
