local function req(file) require("dharmx.plug.config.lsp." .. file) end

return {
  {
    "folke/neoconf.nvim",
    config = function() req("neoconf") end,
    lazy = true,
  },
  {
    "folke/neodev.nvim",
    config = function() req("neodev") end,
    lazy = true,
  },
  {
    "williamboman/mason.nvim",
    config = function() req("mason") end,
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    config = function() req("init") end,
    dependencies = { "folke/neoconf.nvim", "williamboman/mason.nvim", "folke/neodev.nvim" },
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
  { "b0o/schemastore.nvim" },
  {
    "kosayoda/nvim-lightbulb",
    config = function() req("lightbulb") end,
    dependencies = "neovim/nvim-lspconfig",
    lazy = true,
  },
  {
    "simrat39/symbols-outline.nvim",
    init = function() req("outline") end,
    dependencies = "neovim/nvim-lspconfig",
    cmd = "SymbolsOutline",
  },
  {
    "j-hui/fidget.nvim",
    config = function() req("fidget") end,
    dependencies = "neovim/nvim-lspconfig",
    event = "LspAttach",
  },
  {
    "SmiteshP/nvim-navic",
    config = function() req("navic") end,
    lazy = true,
  },
  {
    "mhartington/formatter.nvim",
    config = function() req("formatter") end,
    cmd = "Format",
  },
  {
    "simrat39/rust-tools.nvim",
    lazy = true,
  },
  {
    "mfussenegger/nvim-jdtls",
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    lazy = true,
    config = function() req("masonlsp") end,
  },
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = "williamboman/mason.nvim",
    lazy = true,
    config = function() req("masonnull") end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function() req("null") end,
    lazy = true,
    dependencies = "jayp0521/mason-null-ls.nvim",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = "williamboman/mason.nvim",
    lazy = true,
    config = function() req("masontool") end,
  },
  { "mfussenegger/nvim-dap", lazy = true },
  {
    "jayp0521/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    cmd = "DapToggleBreakpoint",
    config = function() req("masondap") end,
  },
}

-- vim:filetype=lua
