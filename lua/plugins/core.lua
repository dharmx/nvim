local enabled = __KRAKEN.plugins["core"]

use {
  "wbthomason/packer.nvim",
  module = "packer",
  wants = "plenary.nvim",
  config = function()
    require "plugins"
  end,
  disable = not enabled["packer.nvim"],
}

use { "lewis6991/impatient.nvim", disable = not enabled["impatient.nvim"] }
