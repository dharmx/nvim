local function req(file) require("dharmx.plug.config.core." .. file) end

return {
  {
    "folke/lazy.nvim",
  },
  {
    "sheerun/vim-polyglot",
    event = { "CursorHold", "CursorMoved", "InsertEnter", "CmdlineEnter" },
  },
  {
    "dharmx/nvim-colo",
    config = function() req("colo") end,
    lazy = false,
  },
}

-- vim:filetype=lua
