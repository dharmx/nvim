---@diagnostic disable: cast-local-type
local parson = require("scratch.parson")
parson.setup()

parson({
  {
    name = "nvim-tree/nvim-tree.lua",
    on = "BufWritePost",
    opt = true,
    config = function()
      local present, tree = pcall(require, "nvim-tree")
      if present then tree.setup() end
    end,
  },
  {
    name = "folke/twilight.nvim",
    config = function()
      local present, twilight = pcall(require, "twilight")
      if present then twilight.setup() end
    end,
  }
})

parson = parson + { name = "tpope/vim-repeat", opt = true }
