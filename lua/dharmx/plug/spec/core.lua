local function req(file) require("dharmx.plug.config.core." .. file) end

return {
  {
    "folke/lazy.nvim",
  },
  {
    "dharmx/nvim-colo",
    config = function() req("colo") end,
    event = "BufWinEnter",
  },
}

-- vim:filetype=lua
