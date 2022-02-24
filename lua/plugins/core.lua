use {
  "wbthomason/packer.nvim",
  module = "packer",
  wants = "plenary.nvim",
  config = function()
    require "plugins"
  end,
}

use { "lewis6991/impatient.nvim" }
