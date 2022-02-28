local enabled = __KRAKEN.plugins["editing"]

use { "Fymyte/rasi.vim", ft = "rasi", disable = not enabled["rasi.vim"] }
use { "elkowar/yuck.vim", ft = "yuck", disable = not enabled["yuck.vim"] }
use { "kovetskiy/sxhkd-vim", ft = "sxhkdrc", disable = not enabled["sxhkd-vim"] }
use { "MTDL9/vim-log-highlighting", ft = "log", disable = not enabled["vim-log-highlighting"] }

use { "sheerun/vim-polyglot", disable = not enabled["vim-polyglot"] }

use {
  "TimUntersberger/neogit",
  wants = "plenary.nvim",
  cmd = "Neogit",
  module = "neogit",
  disable = not enabled["neogit"],
}

use {
  "lewis6991/gitsigns.nvim",
  wants = "plenary.nvim",
  cmd = "Gitsigns",
  config = function()
    require "configs.editing.gitsigns"
  end,
  disable = not enabled["gitsigns.nvim"],
}

use { "numToStr/Comment.nvim", module = "Comment", disable = not enabled["Comment.nvim"] }
use {
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function()
    require "configs.editing.todo_comments"
  end,
  disable = not enabled["todo-comments.nvim"],
}

use {
  "iamcco/markdown-preview.nvim",
  setup = function()
    require "configs.editing.markdown_preview"
  end,
  run = "cd app && yarn install",
  ft = "markdown",
  disable = not enabled["markdown-preview.nvim"],
}

use {
  "norcalli/nvim-colorizer.lua",
  cmd = {
    "ColorizerToggle",
    "ColorizerReloadAllBuffers",
    "ColorizerAttachToBuffers",
    "ColorizerDetachFromBuffers",
  },
  disable = not enabled["nvim-colorizer.lua"],
}

use {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
  config = function()
    require "configs.editing.trouble"
  end,
  disable = not enabled["trouble.nvim"],
}

use {
  "nvim-orgmode/orgmode",
  ft = "org",
  config = function()
    require "configs.workflow.orgmode"
  end,
}

use {
  "jbyuki/nabla.nvim",
  after = "orgmode",
  config = function()
    require("plugins.others").nabla()
  end,
}
