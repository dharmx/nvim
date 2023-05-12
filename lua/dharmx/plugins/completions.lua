local function req(file) require("dharmx.configs.completions." .. file) end

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
  },
  {
    "gelguy/wilder.nvim",
    config = function() req("wilder") end,
    event = "CmdlineEnter",
  },
  {
    "hrsh7th/nvim-cmp",
    config = function() req("init") end,
    keys = { mode = "i", "<C-Space>" },
    event = "InsertEnter",
  },
  {
    "windwp/nvim-autopairs",
    config = function() req("autopairs") end,
    event = "InsertCharPre",
  },
  {
    "hrsh7th/cmp-buffer",
    event = "InsertCharPre",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "LspAttach",
  },
}
