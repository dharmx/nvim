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
    dependencies = { "b0o/incline.nvim" },
    config = function() req("colo") end,
    branch = "dev",
    dev = true,
    lazy = true,
    event = { "CursorHold", "CursorMoved", "InsertEnter", "CmdlineEnter" },
  },
}
