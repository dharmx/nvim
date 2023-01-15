local function req(file) require("dharmx.plug.config.core." .. file) end

return {
  { "folke/lazy.nvim", keys = { "<leader>pp" } },
  {
    "dharmx/nvim-colo",
    config = vim.schedule_wrap(function() req("colo") end),
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "akinsho/bufferline.nvim",
      "goolord/alpha-nvim",
      "feline-nvim/feline.nvim",
    },
    event = "BufWinEnter",
  },
}

-- vim:filetype=lua
