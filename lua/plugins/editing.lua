use { "Fymyte/rasi.vim", ft = "rasi" }
use { "elkowar/yuck.vim", ft = "yuck" }
use { "kovetskiy/sxhkd-vim", ft = "sxhkdrc" }
use { "MTDL9/vim-log-highlighting", ft = "log" }
use { "vuki656/package-info.nvim", ft = "package.json" }

use { "sheerun/vim-polyglot" }

use {
  "TimUntersberger/neogit",
  wants = "plenary.nvim",
  cmd = "Neogit",
  module = "neogit",
}

use {
  "lewis6991/gitsigns.nvim",
  wants = "plenary.nvim",
  cmd = "Gitsigns",
  config = function()
    require "configs.gitsigns"
  end,
}

use { "numToStr/Comment.nvim", module = "Comment" }

use {
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function()
    require "configs.todo"
  end,
}

use {
  "iamcco/markdown-preview.nvim",
  setup = function()
    require "configs.mdpreview"
  end,
  run = "cd app && yarn install",
  ft = "markdown",
}

use {
  "norcalli/nvim-colorizer.lua",
  cmd = {
    "ColorizerToggle",
    "ColorizerReloadAllBuffers",
    "ColorizerAttachToBuffers",
    "ColorizerDetachFromBuffers",
  },
}

use {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
  config = function()
    require "configs.trouble"
  end,
}

use {
  "NFrid/due.nvim",
  cmd = { "DueDraw", "DueRedraw", "DueClean", "DueAsyncUpdate" },
}

use {
  "stevearc/gkeep.nvim",
  run = ":UpdateRemotePlugins",
  after = "telescope.nvim",
}

use { "jbyuki/venn.nvim", cmd = "ToggleVenn" }

use {
  "oberblastmeister/neuron.nvim",
  wants = { "popup.nvim", "plenary.nvim" },
  after = "telescope.nvim",
}

use {
  "nvim-neorg/neorg",
  ft = "norg",
  after = "nvim-treesitter",
  config = function()
    require "configs.neorg"
  end,
}

use {
  "nvim-orgmode/orgmode",
  ft = "org",
  config = function()
    require "configs.orgmode"
  end,
}

use { "jbyuki/nabla.nvim", after = "orgmode" }

-- vim:ft=lua
