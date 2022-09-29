--- NOTE: Contains plugins that may assist neovim plugin development.
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "euclidianAce/BetterLua.vim",
  event = "CmdlineEnter",
  setup = function()
    require("plugin.config.dev.betterlua")
  end,
  disable = disabled["BetterLua.vim"],
})

use({
  "bfredl/nvim-luadev",
  cmd = {
    "Luadev",
    "LuadevRunline",
    "LuadevRun",
    "LuadevRunWord",
    "LuadevComplete",
  },
  disable = disabled["nvim-luadev"],
})

use({ "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" }, disable = disabled["nvim-luapad"] })
use({ "milisims/nvim-luaref", event = "CmdlineEnter", disable = disabled["nvim-luaref"] })
use({ "nanotee/luv-vimdocs", event = "CmdlineEnter", disable = disabled["luv-vimdocs"] })
use({ "nanotee/nvim-lua-guide", event = "CmdlineEnter", disable = disabled["nvim-lua-guide"] })

use({
  "shift-d/scratch.nvim",
  wants = "telescope.nvim",
  config = function()
    require("telescope").load_extension("scratch")
  end,
  cmd = {
    "ScratchNew",
    "ScratchEval",
  },
  disable = disabled["scratch.nvim"],
})

-- vim:ft=lua
