use {
  "akinsho/bufferline.nvim",
  config = function()
    require "configs.ui.bufferline"
  end,
}

use {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require "configs.ui.devicons"
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
    require "configs.ui.blankline"
  end,
}

use {
  "glepnir/dashboard-nvim",
  setup = function()
    require "configs.ui.dashboard"
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
