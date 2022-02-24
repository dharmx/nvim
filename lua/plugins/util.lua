use { "nvim-lua/plenary.nvim" }

use { "nvim-lua/popup.nvim" }

use { "nathom/filetype.nvim" }

use { "luukvbaal/stabilize.nvim", event = { "CmdlineEnter", "InsertEnter" } }

use {
  "rcarriga/nvim-notify",
  config = function()
    require "configs.util.notify"
  end,
}
