local M = {}

local function use(plugin)
  M[plugin[1]] = plugin
end

use {
  "xiyaowong/nvim-transparent",
  cmd = { "TransparentDisable", "TransparentEnable", "TransparentToggle" },
  config = function()
    require "configs.health.transparent"
  end,
}

use { "sunjon/shade.nvim", cmd = "Shade" }

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
    "TZAtaraxisOn",
    "TZAtaraxisOff",
    "TZMinimalistOn",
    "TZMinimalistOff",
    "TZFocusOn",
    "TZFocusOff",
  },
}

use { "junegunn/goyo.vim", cmd = "Goyo" }

use { "junegunn/limelight.vim", after = "goyo.vim" }

return M

-- vim:ft=lua
