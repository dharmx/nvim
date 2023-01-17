local function req(file) require("dharmx.plug.config.misc." .. file) end

return {
  {
    "rktjmp/paperplanes.nvim",
    config = function() req("paperplanes") end,
    cmd = "PP",
  },
  {
    "wakatime/vim-wakatime",
    event = "InsertCharPre",
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "zz", "zt" },
    config = function() req("neoscroll") end,
  },
  {
    "andweeb/presence.nvim",
    event = "InsertEnter",
    config = function() req("presence") end,
  },
  {
    "rafcamlet/nvim-luapad",
    ft = "lua",
    cmd = { "Luapad", "LuaRun" },
  },
}

-- vim:filetype=lua
