--- NOTE: Contains plugin.spec that this config is fully dependent on.
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "wbthomason/packer.nvim",
  module = "packer",
  config = function()
    require("plugin.spec")
  end,
  disable = disabled["packer.nvim"],
})

use({ "nvim-lua/plenary.nvim", disable = disabled["plenary.nvim"] })

use({ "lewis6991/impatient.nvim", disable = disabled["impatient.nvim"] })

-- vim:ft=lua
