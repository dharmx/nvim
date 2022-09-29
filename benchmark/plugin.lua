local benchmark = require("plenary.benchmark")

benchmark("Load time for some important plugins.", {
  warmup = 1,
  runs = 25,
  fun = {
    {
      "Load Comment.nvim",
      function()
        local packer = require("packer")
        packer.loader("Comment.nvim")
      end,
    },
    {
      "Load nvim-cmp",
      function()
        local packer = require("packer")
        packer.loader("nvim-cmp")
      end,
    },
    {
      "Load LSP plugins",
      function()
        vim.cmd("LspStart")
      end,
    },
    {
      "Load nvim-treesitter",
      function()
        vim.cmd("TSStart")
      end,
    },
    {
      "Load telescope.nvim",
      function()
        local packer = require("packer")
        packer.loader("telescope.nvim")
      end,
    },
  },
})
