local enabled = __KRAKEN.plugins["development"]

use {
  "euclidianAce/BetterLua.vim",
  ft = "lua",
  setup = function()
    require "configs.development.betterlua"
  end,
  disable = not enabled["BetterLua.vim"],
}

use { "bfredl/nvim-luadev", cmd = "Luadev", disable = not enabled["nvim-luadev"] }
use { "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" }, disable = not enabled["nvim-luapad"] }
use { "milisims/nvim-luaref", ft = { "vim", "lua" }, disable = not enabled["nvim-luaref"] }
