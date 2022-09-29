--- NOTE: LSP related plugins. Contains subcategories such as lsp server managers,
--- NOTE: other LSP server that aren't yet added to nvim-lspconfig and some LSP ui components
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "williamboman/nvim-lsp-installer",
  config = function()
    require("plugin.config.lsp.lsp_installer")
  end,
  cmd = {
    "LspInstallInfo",
    "LspInstallLog",
    "LspStart",
  },
  module = "nvim-lsp-installer",
  disable = disabled["nvim-lsp-installer"],
})

use({
  "mfussenegger/nvim-jdtls",
  module = "jdtls",
  disable = disabled["nvim-jdtls"],
})

use({
  "simrat39/rust-tools.nvim",
  module = "rust-tools",
  disable = disabled["rust-tools.nvim"],
})

use({ "b0o/schemastore.nvim", module = "schemastore", disable = disabled["schemastore.nvim"] })

use({
  "kosayoda/nvim-lightbulb",
  module = "nvim-lightbulb",
  config = function()
    require("plugin.config.lsp.handlers.lightbulb")
  end,
  disable = disabled["nvim-lightbulb"],
})

use({
  "neovim/nvim-lspconfig",
  config = function()
    require("plugin.config.lsp.lspconfig")
  end,
  wants = { "nlsp-settings.nvim", "null-ls.nvim", "cmp-nvim-lsp" },
  after = "nvim-lsp-installer",
  disable = disabled["nvim-lspconfig"],
})

use({
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    require("plugin.config.lsp.null_ls")
  end,
  module = "null-ls",
  disable = disabled["null-ls.nvim"],
})

use({
  "simrat39/symbols-outline.nvim",
  setup = function()
    require("plugin.config.lsp.outline")
  end,
  after = "nvim-lspconfig",
  disable = disabled["symbols-outline.nvim"],
})

use({
  "tamago324/nlsp-settings.nvim",
  config = function()
    require("plugin.config.lsp.nlsp")
  end,
  opt = true,
  disable = disabled["nlsp-settings.nvim"],
})

-- vim:ft=lua
