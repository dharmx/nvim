use {
  "euclidianAce/BetterLua.vim",
  ft = "lua",
  setup = function()
    require "configs.betterlua"
  end,
}

use { "bfredl/nvim-luadev", cmd = "Luadev" }

use { "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" } }
use { "milisims/nvim-luaref", ft = { "vim", "lua" } }
use { "nanotee/luv-vimdocs", ft = { "vim", "lua" } }
use { "nanotee/nvim-lua-guide", ft = { "vim", "lua" } }

-- vim:ft=lua
