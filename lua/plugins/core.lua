use {
  "wbthomason/packer.nvim",
  wants = "plenary.nvim",
  module = "packer",
  config = function()
    require "plugins"
  end,
}

use { "lewis6991/impatient.nvim" }

-- vim:ft=lua
