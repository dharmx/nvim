local enabled = __KRAKEN.plugins["others"]

use {
  "rinx/nvim-minimap",
  cmd = { "MinimapOpen", "MinimapClose", "MinimapRefresh", "MinimapToggle" },
  disable = not enabled["nvim_minimap"],
}

use {
  "tpope/vim-dispatch",
  cmd = { "Dispatch", "Make", "Focus", "Start" },
  disable = not enabled["vim_dispatch"],
}

use {
  "andweeb/presence.nvim",
  event = "InsertEnter",
  config = function()
    require "configs.others.presence_nvim"
  end,
  disable = not enabled["presence_nvim"],
}

use {
  "wakatime/vim-wakatime",
  cmd = "WakatimeToday",
  disable = not enabled["vim_wakatime"],
}

use {
  "karb94/neoscroll.nvim",
  cmd = {
    "NeoscrollEnablePM",
    "NeoscrollEnableGlobalPM",
    "NeoscrollDisablePM",
    "NeoscrollDisableGlobalePM",
    "NeoscrollEnableBufferPM",
    "NeoscrollDisableBufferPM",
  },
  config = function()
    require "configs.others.neoscroll_nvim"
  end,
  disable = not enabled["neoscroll_nvim"],
}

use {
  "Xuyuanp/scrollbar.nvim",
  events = { "WinScrolled", "VimResized", "QuitPre" },
  setup = function()
    require "configs.others.scrollbar_nvim"
  end,
  disable = not enabled["scrollbar_nvim"],
}
