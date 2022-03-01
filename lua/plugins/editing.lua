local enabled = __KRAKEN.plugins["editing"]

use { "Fymyte/rasi.vim", ft = "rasi", disable = not enabled["rasi_vim"] }
use { "elkowar/yuck.vim", ft = "yuck", disable = not enabled["yuck_vim"] }
use { "kovetskiy/sxhkd-vim", ft = "sxhkdrc", disable = not enabled["sxhkd_vim"] }
use { "MTDL9/vim-log-highlighting", ft = "log", disable = not enabled["vim_log_highlighting"] }

use { "sheerun/vim-polyglot", disable = not enabled["vim_polyglot"] }

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
    require "configs.editing.gitsigns_nvim"
  end,
  disable = not enabled["gitsigns_nvim"],
}

use { "numToStr/Comment.nvim", module = "Comment", disable = not enabled["Comment_nvim"] }

use {
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function()
    require "configs.editing.todo_comments_nvim"
  end,
  disable = not enabled["todo_comments_nvim"],
}

use {
  "iamcco/markdown-preview.nvim",
  setup = function()
    require "configs.editing.markdown_preview_nvim"
  end,
  run = "cd app && yarn install",
  ft = "markdown",
  disable = not enabled["markdown_preview_nvim"],
}

use {
  "norcalli/nvim-colorizer.lua",
  cmd = {
    "ColorizerToggle",
    "ColorizerReloadAllBuffers",
    "ColorizerAttachToBuffers",
    "ColorizerDetachFromBuffers",
  },
  disable = not enabled["nvim_colorizer_lua"],
}

use {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
  config = function()
    require "configs.editing.trouble_nvim"
  end,
  disable = not enabled["trouble_nvim"],
}

use {
  "nvim-orgmode/orgmode",
  ft = "org",
  config = function()
    require "configs.workflow.orgmode"
  end,
  disable = not enabled["orgmode"],
}

use {
  "jbyuki/nabla.nvim",
  after = "orgmode",
  disable = not enabled["nabla_nvim"],
}
