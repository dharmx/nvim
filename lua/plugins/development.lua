local enabled = __KRAKEN.plugins["development"]

use {
  "euclidianAce/BetterLua.vim",
  ft = "lua",
  setup = function()
    require "configs.development.BetterLua_vim"
  end,
  disable = not enabled["BetterLua_vim"],
}

use { "bfredl/nvim-luadev", cmd = "Luadev", disable = not enabled["nvim_luadev"] }
use { "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" }, disable = not enabled["nvim_luapad"] }
use { "milisims/nvim-luaref", ft = { "vim", "lua" }, disable = not enabled["nvim_luaref"] }
use { "nanotee/luv-vimdocs", ft = { "vim", "lua" }, disable = not enabled["luv_vimdocs"] }
