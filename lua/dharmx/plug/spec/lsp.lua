local function req(file) require("dharmx.plug.config.lsp." .. file) end

return {
  {
    "folke/neoconf.nvim",
    config = function() req("neoconf") end,
  },
  {
    "folke/neodev.nvim",
    config = function() req("neodev") end,
  },
  {
    "williamboman/mason.nvim",
    config = function() req("mason") end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function() req("init") end,
    dependencies = { "folke/neoconf.nvim", "williamboman/mason.nvim", "folke/neodev.nvim" },
  },
  { "b0o/schemastore.nvim" },
  {
    "kosayoda/nvim-lightbulb",
    config = function() req("lightbulb") end,
  },
  {
    "simrat39/symbols-outline.nvim",
    init = function() req("outline") end,
    dependencies = "neovim/nvim-lspconfig",
  },
  {
    "j-hui/fidget.nvim",
    config = function() req("fidget") end,
    dependencies = "neovim/nvim-lspconfig",
  },
  {
    "SmiteshP/nvim-navic",
    config = function() req("navic") end,
  },
  {
    "lukas-reineke/lsp-format.nvim",
    config = function() req("format") end,
  },
  {
    "simrat39/rust-tools.nvim",
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    config = function() req("masonlsp") end,
  },
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = "williamboman/mason.nvim",
    config = function() req("masonnull") end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function() req("null") end,
    dependencies = "jayp0521/mason-null-ls.nvim",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = "williamboman/mason.nvim",
    config = function() req("masontool") end,
  },
  { "mfussenegger/nvim-dap" },
  {
    "jayp0521/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    config = function() req("masondap") end,
  },
}

-- vim:filetype=lua
