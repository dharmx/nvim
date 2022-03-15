local M = {}

local function use(plugin)
  M[plugin[1]] = plugin
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

use {
  "tamago324/nlsp-settings.nvim",
  module = "nlspsettings",
}

return M

-- vim:ft=lua
