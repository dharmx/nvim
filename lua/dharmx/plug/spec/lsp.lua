local function req(file) require("dharmx.plug.config.lsp." .. file) end

return {
  {
    "williamboman/mason.nvim",
    config = function() req("mason") end,
  },
  {
    "folke/neoconf.nvim",
  },
  {
    "folke/neodev.nvim",
  },
  {
    "b0o/schemastore.nvim",
  },
  {
    "kosayoda/nvim-lightbulb",
    config = function() req("lightbulb") end,
  },
  {
    "SmiteshP/nvim-navic",
    config = function() req("navic") end,
  },
  {
    "simrat39/rust-tools.nvim",
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function() req("masonlsp") end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function() req("init") end,
    cmd = "LspStart",
  },
  {
    "simrat39/symbols-outline.nvim",
    init = function() req("outline") end,
    event = "LspAttach",
  },
  {
    "j-hui/fidget.nvim",
    config = function() req("fidget") end,
    event = "LspAttach",
  },
  {
    "mhartington/formatter.nvim",
    config = function() req("formatter") end,
    event = "LspAttach",
  },
  {
    "jayp0521/mason-null-ls.nvim",
    config = function() req("masonnull") end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function() req("null") end,
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim", "jayp0521/mason-null-ls.nvim" },
    event = "LspAttach",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function() req("masontool") end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "jayp0521/mason-nvim-dap.nvim" },
  },
  {
    "jayp0521/mason-nvim-dap.nvim",
    config = function() req("masondap") end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function() req("dapui") end,
    event = "LspAttach",
  },
}
