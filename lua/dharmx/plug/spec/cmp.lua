local function req(file) require("dharmx.plug.config.cmp." .. file) end

return {
  { "rafamadriz/friendly-snippets", event = "InsertEnter" },
  {
    "L3MON4D3/LuaSnip",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = "rafamadriz/friendly-snippets",
    config = function() req("luasnip") end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function() req("init") end,
    dependencies = "L3MON4D3/LuaSnip",
  },
  {
    "hrsh7th/cmp-nvim-lua",
    dependencies = "hrsh7th/nvim-cmp",
  },
  {
    "windwp/nvim-autopairs",
    config = function() req("autopairs") end,
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "hrsh7th/cmp-cmdline",
    dependencies = "hrsh7th/nvim-cmp",
    event = "CmdlineEnter",
  },
  {
    "hrsh7th/cmp-buffer",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-path",
    dependencies = "hrsh7th/cmp-buffer",
    keys = { { "/", mode = "i" } },
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
    },
  },
}

-- vim:filetype=lua
