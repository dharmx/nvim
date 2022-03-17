local M = {}

local function use(plugin)
  table.insert(M, plugin)
end

use {
  "toppair/reach.nvim",
  config = function()
    require "configs.ui.reach"
  end,
  module = "reach",
}

use {
  "akinsho/bufferline.nvim",
  branch = "feature/themeable-option",
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
  opt = true,
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
  module = "alpha",
  cmd = {
    "Alpha",
    "AlphaRedraw",
  },
}

return M

-- vim:ft=lua
