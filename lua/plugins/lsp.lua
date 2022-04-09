local M = {}

local function use(plugin)
  table.insert(M, plugin)
end

use {
  "jose-elias-alvarez/null-ls.nvim",
  wants = "plenary.nvim",
  module = "null-ls",
}

use {
  "williamboman/nvim-lsp-installer",
  config = function()
    require "configs.lsp"
  end,
  wants = "nvim-lspconfig",
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
  module = "nvim-lsp-installer",
}

use { "mfussenegger/nvim-jdtls", after = "nvim-lspconfig" }

use { "b0o/schemastore.nvim", module = "schemastore" }

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
  setup = function()
    require "configs.lsp.outline"
  end,
  after = "nvim-lspconfig",
}

use { "tamago324/nlsp-settings.nvim", module = "nlspsettings" }

return M

-- vim:ft=lua
