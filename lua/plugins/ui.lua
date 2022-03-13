use {
  "toppair/reach.nvim",
  config = function()
    require("configs.reach").setup()
  end,
  module = "reach",
}

use {
  "akinsho/bufferline.nvim",
  branch = "feature/themeable-option",
  config = function()
    require "configs.bufferline"
  end,
}

use {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require "configs.devicons"
  end,
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
    require "configs.blankline"
  end,
}

use {
  "VonHeikemen/fine-cmdline.nvim",
  cmd = "FineCmdline",
  config = function()
    require "configs.finecmdline"
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
    require "configs.searchbox"
  end,
}

use {
  "glepnir/dashboard-nvim",
  setup = function()
    require "configs.dashboard"
  end,
  cmd = {
    "Dashboard",
    "DashboardChangeColorscheme",
    "DashboardFindFile",
    "DashboardFindHistory",
    "DashboardFindWord",
    "DashboardJumpMarks",
    "DashboardNewFile",
  },
}

-- vim:ft=lua
