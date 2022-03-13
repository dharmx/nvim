use { "nvim-lua/plenary.nvim", opt = true }

use { "nvim-lua/popup.nvim", opt = true }

use { "luukvbaal/stabilize.nvim", event = { "CmdlineEnter", "InsertEnter" } }

use {
  "rcarriga/nvim-notify",
  config = function()
    require "configs.notify"
  end,
}

use { "MunifTanjim/nui.nvim", module = "nui" }

use { "tami5/sqlite.lua", module = "sqlite" }

use { "dstein64/vim-startuptime", cmd = "StartupTime" }

use { "gyim/vim-boxdraw", event = "BufRead" }

-- vim:ft=lua
