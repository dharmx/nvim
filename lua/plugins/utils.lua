local enabled = __KRAKEN.plugins["utils"]

use { "nvim-lua/plenary.nvim", disable = not enabled["plenary.nvim"] }

use { "nvim-lua/popup.nvim", disable = not enabled["popup.nvim"] }

use { "nathom/filetype.nvim", disable = not enabled["filetype.nvim"] }

use { "luukvbaal/stabilize.nvim", event = { "CmdlineEnter", "InsertEnter" }, disable = not enabled["stabilize.nvim"] }

use {
  "rcarriga/nvim-notify",
  config = function()
    require "configs.utils.notify"
  end,
  disable = not enabled["nvim-notify"],
}
