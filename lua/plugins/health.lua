local enabled = __KRAKEN.plugins["health"]

use {
  "xiyaowong/nvim-transparent",
  cmd = { "TransparentDisable", "TransparentEnable", "TransparentToggle" },
  config = function()
    require "configs.health.nvim_transparent"
  end,
  disable = not enabled["nvim_transparent"],
}

use {
  "folke/twilight.nvim",
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  config = function()
    require "configs.health.twilight_nvim"
  end,
  disable = not enabled["twilight_nvim"],
}

use {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require "configs.health.zen_mode_nvim"
  end,
  disable = not enabled["zen_mode_nvim"],
}

use {
  "junegunn/goyo.vim",
  cmd = "Goyo",
  disable = not enabled["goyo_vim"],
}

use {
  "junegunn/limelight.vim",
  after = "goyo.vim",
  disable = not enabled["limelight_vim"],
}
