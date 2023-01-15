local function req(file) require("dharmx.plug.config.core." .. file) end

return {
  { "folke/lazy.nvim" },
  {
    "dharmx/nvim-colo",
    config = function() req("colo") end,
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "akinsho/bufferline.nvim",
      "goolord/alpha-nvim",
      "feline-nvim/feline.nvim",
    },
    event = { "CursorHold", "CursorMoved" },
  },
}

-- vim:filetype=lua
