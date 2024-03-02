return {
  "rafamadriz/friendly-snippets",
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    config = function()
      require("plugins.completions.snippets")
    end,
  },
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.completions.cmp")
    end,
    keys = { mode = "i", "<C-Space>" },
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.completions.autopairs")
    end,
  },
}
