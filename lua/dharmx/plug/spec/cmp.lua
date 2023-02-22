local function req(file) require("dharmx.plug.config.cmp." .. file) end

return {
  {
    "rafamadriz/friendly-snippets",
    lazy = false,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function() req("luasnip") end,
    event = "InsertCharPre",
  },
  {
    "saadparwaiz1/cmp_luasnip",
    event = "InsertCharPre",
  },
  {
    "hrsh7th/cmp-nvim-lua",
    ft = "lua",
    event = "InsertCharPre",
  },
  {
    "hrsh7th/nvim-cmp",
    config = function() req("init") end,
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "windwp/nvim-autopairs",
    config = function() req("autopairs") end,
    event = "InsertCharPre",
  },
  {
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    event = "LspAttach",
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    event = "LspAttach",
  },
  {
    "hrsh7th/cmp-cmdline",
    event = "CmdlineEnter",
  },
  {
    "hrsh7th/cmp-buffer",
    event = { "InsertCharPre", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-path",
    keys = { { mode = "i", "/" } },
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "LspAttach",
  },
}
