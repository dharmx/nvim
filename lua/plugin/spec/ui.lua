--- NOTE: Adds and polishes neovim UI components. Such as tabline, indent lines, etc.
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "lukas-reineke/virt-column.nvim",
  config = function()
    require("plugin.config.ui.virtcol")
  end,
  disable = disabled["virt-column.nvim"],
})

use({
  "fgheng/winbar.nvim",
  config = function()
    require("plugin.config.ui.winbar")
  end,
  event = "UIEnter",
  disable = disabled["winbar.nvim"],
})

use({
  "nvim-zh/colorful-winsep.nvim",
  config = function()
    require("plugin.config.ui.winsep")
  end,
  event = "UIEnter",
  disable = disabled["colorful-winsep.nvim"],
})

use({
  "edluffy/specs.nvim",
  config = function()
    require("plugin.config.ui.specs")
  end,
  event = { "CursorMoved", "CursorMovedI" },
  disable = disabled["specs.nvim"],
})

use({
  "b0o/incline.nvim",
  config = function()
    require("plugin.config.ui.incline")
  end,
  wants = "nvim-web-devicons",
  disable = disabled["incline.nvim"],
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
  module = "bufferline",
  disable = disabled["bufferline.nvim"],
})

use({
  "kyazdani42/nvim-web-devicons",
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
  after = "nvim-treesitter",
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
  cmd = {
    "Alpha",
    "AlphaRedraw",
  },
  disable = disabled["alpha-nvim"],
})

use({
  "petertriho/nvim-scrollbar",
  config = function()
    require("plugin.config.ui.scrollbar")
  end,
  after = { "gitsigns.nvim", "nvim-hlslens" },
  disable = disabled["nvim-scrollbar"],
})

use({
  "sidebar-nvim/sidebar.nvim",
  config = function()
    require("plugin.config.workflow.sidebar")
  end,
  disable = disabled["sidebar.nvim"],
  after = "nvim-lsp-installer",
})

use({
  "feline-nvim/feline.nvim",
  module = "feline",
  disable = disabled["feline.nvim"]
})

-- vim:ft=lua
