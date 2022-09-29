--- NOTE: Focuses on functions such as brightness, productivity boosts. etc
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "sunjon/shade.nvim",
  config = function()
    require("plugin.config.wellbeing.shade")
  end,
  keys = "<leader>s",
  cmd = "Shade",
  disable = disabled["shade.nvim"],
})

use({
  "folke/twilight.nvim",
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  config = function()
    require("plugin.config.wellbeing.twilight")
  end,
  disable = disabled["twilight.nvim"],
})

use({
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require("plugin.config.wellbeing.zenmode")
  end,
  disable = disabled["zen-mode.nvim"],
})

use({
  "Pocco81/TrueZen.nvim",
  cmd = {
    "TZAtaraxis",
    "TZMinimalist",
    "TZFocus",
  },
  disable = disabled["TrueZen.nvim"],
})

-- vim:ft=lua
