local M = {}

local function use(plugin)
  M[plugin[1]] = plugin
end

use {
  "rinx/nvim-minimap",
  cmd = { "MinimapOpen", "MinimapClose", "MinimapRefresh", "MinimapToggle" },
}

use { "tpope/vim-dispatch", cmd = { "Dispatch", "Make", "Focus", "Start" } }

use {
  "andweeb/presence.nvim",
  event = "InsertEnter",
  config = function()
    require "configs.others.presence"
  end,
}

use { "wakatime/vim-wakatime", event = "InsertEnter" }

use {
  "KadoBOT/nvim-spotify",
  wants = "telescope.nvim",
  config = function()
    require "configs.others.spotify"
  end,
  run = "make",
  cmd = { "SpotifyDevices", "Spotify" },
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
    require "configs.others.neoscroll"
  end,
}

use {
  "Xuyuanp/scrollbar.nvim",
  events = { "WinScrolled", "VimResized", "QuitPre" },
  setup = function()
    require "configs.others.scrollbar"
  end,
  module = "scrollbar",
}

return M

-- vim:ft=lua
