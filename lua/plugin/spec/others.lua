--- NOTE: Bling plugins. These are mostly useless. Adds components like
--- NOTE: urlshortner, minimaps, discord-rpc, scrollbar, etc.
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "rktjmp/paperplanes.nvim",
  config = function()
    require("plugin.config.others.paperplanes")
  end,
  cmd = "PP",
  disable = disabled["paperplanes.nvim"],
})

use({
  "rinx/nvim-minimap",
  cmd = { "MinimapOpen", "MinimapClose", "MinimapRefresh", "MinimapToggle" },
  disable = disabled["nvim-minimap"],
})

use({ 
  "tpope/vim-dispatch", cmd = { "Dispatch", "Make", "Focus", "Start" },
  disable = disabled["vim-dispatch"],
})

use({
  "andweeb/presence.nvim",
  event = "InsertEnter",
  config = function()
    require("plugin.config.others.presence")
  end,
  disable = disabled["presence.nvim"],
})

use({
  "wakatime/vim-wakatime",
  event = "UIEnter",
  disable = disabled["vim-wakatime"],
})

use({
  "KadoBOT/nvim-spotify",
  wants = "telescope.nvim",
  config = function()
    require("plugin.config.others.spotify")
  end,
  run = "make",
  cmd = { "SpotifyDevices", "Spotify" },
  disable = disabled["nvim-spotify"],
})

use({
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
    require("plugin.config.others.neoscroll")
  end,
  disable = disabled["neoscroll.nvim"],
})

use({
  "Xuyuanp/scrollbar.nvim",
  event = { "WinScrolled", "VimResized", "QuitPre" },
  setup = function()
    require("plugin.config.others.scrollbar")
  end,
  module = "scrollbar",
  disable = disabled["scrollbar.nvim"],
})

-- vim:ft=lua
