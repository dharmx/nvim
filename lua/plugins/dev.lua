local M = {}

local function use(plugin)
  table.insert(M, plugin)
end

use {
  "euclidianAce/BetterLua.vim",
  event = "CmdlineEnter",
  setup = function()
    require "configs.dev.betterlua"
  end,
}

use {
  "bfredl/nvim-luadev",
  cmd = {
    "Luadev",
    "LuadevRunline",
    "LuadevRun",
    "LuadevRunWord",
    "LuadevComplete",
  },
}

use { "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" } }
use { "milisims/nvim-luaref", event = "CmdlineEnter" }
use { "nanotee/luv-vimdocs", event = "CmdlineEnter" }
use { "nanotee/nvim-lua-guide", event = "CmdlineEnter" }

use {
  "shift-d/scratch.nvim",
  wants = "telescope.nvim",
  config = function()
    require("telescope").load_extension "scratch"
  end,
  cmd = {
    "ScratchNew",
    "ScratchEval",
  },
}

return M

-- vim:ft=lua
