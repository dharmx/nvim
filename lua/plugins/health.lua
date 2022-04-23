--- NOTE: Focuses on functions such as brightness, productivity boosts. etc

use {
  "sunjon/shade.nvim",
  config = function()
    require "configs.health.shade"
  end,
  keys = "<leader>s",
  cmd = "Shade",
}

use {
  "folke/twilight.nvim",
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  config = function()
    require "configs.health.twilight"
  end,
}

use {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require "configs.health.zenmode"
  end,
}

use {
  "Pocco81/TrueZen.nvim",
  cmd = {
    "TZAtaraxis",
    "TZMinimalist",
    "TZFocus",
  },
}

-- vim:ft=lua
