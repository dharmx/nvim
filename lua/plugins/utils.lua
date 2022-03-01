local enabled = __KRAKEN.plugins["utils"]

use { "nvim-lua/plenary.nvim", disable = not enabled["plenary_nvim"] }

use { "nvim-lua/popup.nvim", disable = not enabled["popup_nvim"] }

use { "nathom/filetype.nvim", disable = not enabled["filetype_nvim"] }

use { "luukvbaal/stabilize.nvim", event = { "CmdlineEnter", "InsertEnter" }, disable = not enabled["stabilize_nvim"] }

use {
  "rcarriga/nvim-notify",
  config = function()
    require "configs.utils.nvim_notify"
  end,
  disable = not enabled["nvim_notify"],
}

use { "tami5/sqlite.lua", module = "sqlite", disable = not enabled["sqlite_lua"] }

use {
  "dstein64/vim-startuptime",
  cmd = "StartupTime",
  disable = not enabled["vim_startuptime"],
}

use {
  "gyim/vim-boxdraw",
  disable = not enabled["vim_boxdraw"],
}
