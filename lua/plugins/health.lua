local enabled = __KRAKEN.plugins["health"]

use {
  "xiyaowong/nvim-transparent",
  cmd = { "TransparentDisable", "TransparentEnable", "TransparentToggle" },
  config = function()
    require "configs.health.transparent"
  end,
  disable = not enabled["nvim-transparent"],
}

use {
  "folke/twilight.nvim",
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  config = function()
    require "configs.health.twilight"
  end,
  disable = not enabled["twilight.nvim"],
}

use {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require "configs.health.zenmode"
  end,
  disable = not enabled["zen-mode.nvim"],
}
