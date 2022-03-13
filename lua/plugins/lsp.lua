use {
  "jose-elias-alvarez/null-ls.nvim",
  wants = "plenary.nvim",
  module = "null-ls",
}

use {
  "ThePrimeagen/refactoring.nvim",
  after = { "null-ls.nvim", "telescope.nvim" },
  config = function()
    require "configs.refactoring"
    require("telescope").load_extension "refactoring"
  end,
}

use {
  "williamboman/nvim-lsp-installer",
  config = function()
    require "configs.lsp"
  end,
  wants = { "nvim-lspconfig" },
  cmd = {
    "LspInstallInfo",
    "LspInstallLog",
    "LspInstall",
    "LspUpdateAll",
    "LspStart",
    "LspInfo",
    "LspPrintInstalled",
    "LspRestart",
    "LspStop",
    "LspUninstall",
    "LspUninstallall",
  },
}

use { "b0o/schemastore.nvim", module = "schemastore" }

use {
  "glepnir/lspsaga.nvim",
  after = "nvim-lspconfig",
  config = function()
    require "configs.lsp.lspsaga"
  end,
}

use {
  "kosayoda/nvim-lightbulb",
  module = "nvim-lightbulb",
  config = function()
    require "configs.lsp.handlers.lightbulb"
  end,
}

use { "neovim/nvim-lspconfig", opt = true }

use {
  "simrat39/symbols-outline.nvim",
  config = function()
    require "configs.lsp.outline"
  end,
  after = "nvim-lspconfig",
  cmd = { "SymbolsOutline", "SymbolsOutlineClose", "SymbolsOutlineOpen" },
}

use {
  "ray-x/lsp_signature.nvim",
  after = "nvim-lspconfig",
  config = function()
    require "configs.lsp.signature"
  end,
}

-- vim:ft=lua
