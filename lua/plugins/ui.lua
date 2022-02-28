local enabled = __KRAKEN.plugins["ui"]

use {
  "akinsho/bufferline.nvim",
  config = function()
    require "configs.ui.bufferline"
  end,
  disable = not enabled["bufferline.nvim"],
}

use {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require "configs.ui.devicons"
  end,
  disable = not enabled["nvim-web-devicons"],
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
  disable = not enabled["indent-blankline.nvim"],
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
  disable = not enabled["dashboard-nvim"],
}
