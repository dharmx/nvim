local enabled = __KRAKEN.plugins["ui"]

use {
  "akinsho/bufferline.nvim",
  config = function()
    require "configs.ui.bufferline_nvim"
  end,
  disable = not enabled["bufferline_nvim"],
}

use {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require "configs.ui.nvim_web_devicons"
  end,
  disable = not enabled["nvim_web_devicons"],
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
    require "configs.ui.indent_blankline_nvim"
  end,
  disable = not enabled["indent_blankline_nvim"],
}

use {
  "glepnir/dashboard-nvim",
  setup = function()
    require "configs.ui.dashboard_nvim"
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
  disable = not enabled["dashboard_nvim"],
}
