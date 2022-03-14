local M = {}

local function use(plugin)
  M[plugin[1]] = plugin
end

use {
  "wbthomason/packer.nvim",
  module = "packer",
  wants = "plenary.nvim",
  config = function()
    require "plugins"
  end,
}

use { "lewis6991/impatient.nvim" }

return M

-- vim:ft=lua
