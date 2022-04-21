use {
  "nvim-lua/plenary.nvim",
}

use {
  "nvim-lua/popup.nvim",
  opt = true,
}

use {
  "luukvbaal/stabilize.nvim",
  event = {
    "CmdlineEnter",
    "InsertEnter",
  },
}

use {
  "rcarriga/nvim-notify",
  config = function()
    require "configs.utils.notify"
  end,
}

use { "MunifTanjim/nui.nvim", module = "nui" }

use { "tami5/sqlite.lua", module = "sqlite" }

-- vim:ft=lua
