use { "Fymyte/rasi.vim", ft = "rasi" }
use { "elkowar/yuck.vim", ft = "yuck" }
use { "kovetskiy/sxhkd-vim", ft = "sxhkdrc" }
use { "MTDL9/vim-log-highlighting", ft = "log" }

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
    require "configs.code.gitsigns"
  end,
}

use { "numToStr/Comment.nvim", module = "Comment" }
use {
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function()
    require "configs.code.todo_comments"
  end,
}

use {
  "iamcco/markdown-preview.nvim",
  setup = function()
    require "configs.code.markdown_preview"
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
    require "configs.code.trouble"
  end,
}
