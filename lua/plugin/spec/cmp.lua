--- NOTE: This file contains all completion related plugins.
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "hrsh7th/nvim-cmp",
  config = function()
    require("plugin.config.cmp")
  end,
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  disable = disabled["nvim-cmp"],
})

use({
  "tamago324/cmp-zsh",
  after = "nvim-cmp",
  config = function()
    require("plugin.config.cmp.zsh")
  end,
  disable = disabled["cmp-zsh"],
})

use({
  "uga-rosa/cmp-dictionary",
  wants = "nvim-cmp",
  ft = {
    "text",
    "txt",
    "plaintex",
    "plaintext",
    "tex",
    "markdown",
  },
  config = function()
    require("plugin.config.cmp.dictionary")
  end,
  disable = disabled["cmp-dictionary"],
})

use({
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    require("plugin.config.cmp.luasnip")
  end,
  disable = disabled["LuaSnip"],
})

use({
  "windwp/nvim-autopairs",
  config = function()
    require("plugin.config.cmp.autopairs")
  end,
  event = "InsertEnter",
  disable = disabled["nvim-autopairs"],
})

use({
  "petertriho/cmp-git",
  wants = "nvim-cmp",
  config = function()
    require("plugin.config.cmp.git")
  end,
  opt = true,
  disable = disabled["cmp-git"],
})

use({
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  after = {
    "nvim-cmp",
    "nvim-lspconfig",
  },
  disable = disabled["cmp-nvim-lsp-document-symbol"],
})

use({
  "hrsh7th/cmp-nvim-lsp-signature-help",
  after = {
    "nvim-cmp",
    "nvim-lspconfig",
  },
  disable = disabled["cmp-nvim-lsp-signature-help"],
})

use({
  "dmitmel/cmp-cmdline-history",
  after = "nvim-cmp",
  event = "CmdlineEnter",
  disable = disabled["cmp-cmdline-history"],
})

use({
  "quangnguyen30192/cmp-nvim-tags",
  wants = "nvim-cmp",
  ft = {
    "htnl",
    "xml",
    "markdown",
    "svelte",
    "tsx",
    "js",
    "javascript",
    "typescript",
    "tsx",
  },
  disable = disabled["cmp-nvim-tags"],
})

use({
  "David-Kunz/cmp-npm",
  wants = "nvim-cmp",
  ft = "package.json",
  disable = disabled["cmp-npm"],
})

use({
  "andersevenrud/cmp-tmux",
  wants = "nvim-cmp",
  ft = "tmux",
  disable = disabled["cmp-tmux"],
})

use({
  "hrsh7th/cmp-emoji",
  wants = "nvim-cmp",
  ft = {
    "tex",
    "markdown",
    "txt",
    "plaintext",
    "plaintex",
  },
  disable = disabled["cmp-emoji"],
})

use({
  "hrsh7th/cmp-nvim-lsp",
  config = function()
    require("plugin.config.cmp.lsp")
  end,
  opt = true,
  disable = disabled["cmp-nvim-lsp"],
})

use({
  "hrsh7th/cmp-calc",
  after = "nvim-cmp",
  disable = disabled["cmp-calc"],
})

use({
  "octaltree/cmp-look",
  after = "nvim-cmp",
  disable = disabled["cmp-look"],
})

use({
  "f3fora/cmp-spell",
  after = "nvim-cmp",
  disable = disabled["cmp-spell"],
})

use({
  "hrsh7th/cmp-omni",
  after = "nvim-cmp",
  disable = disabled["cmp-omni"],
})

use({
  "lukas-reineke/cmp-rg",
  after = "nvim-cmp",
  disable = disabled["cmp-rg"],
})

use({
  "ray-x/cmp-treesitter",
  after = {
    "nvim-treesitter",
    "nvim-cmp",
  },
  disable = disabled["cmp-treesitter"],
})

use({
  "hrsh7th/cmp-nvim-lua",
  after = "nvim-cmp",
  disable = disabled["cmp-nvim-lua"],
})

use({
  "kdheepak/cmp-latex-symbols",
  wants = "nvim-cmp",
  ft = "tex",
  disable = disabled["cmp-latex-symbols"],
})

use({
  "saadparwaiz1/cmp_luasnip",
  after = {
    "LuaSnip",
    "nvim-cmp",
  },
  disable = disabled["cmp_luasnip"],
})

use({
  "hrsh7th/cmp-cmdline",
  wants = "nvim-cmp",
  event = "CmdlineEnter",
  disable = disabled["cmp-cmdline"],
})

use({
  "hrsh7th/cmp-buffer",
  wants = "nvim-cmp",
  event = "InsertEnter",
  disable = disabled["cmp-buffer"],
})

use({
  "hrsh7th/cmp-path",
  wants = "cmp-buffer",
  keys = { { "i", "/" } },
  disable = disabled["cmp-path"],
})

use({
  "dmitmel/cmp-digraphs",
  after = "nvim-cmp",
  disable = disabled["cmp-digraphs"],
})

use({
  "davidsierradz/cmp-conventionalcommits",
  after = "cmp-buffer",
  disable = disabled["cmp-conventionalcommits"],
})

use({
  "max397574/cmp-greek",
  after = "nvim-cmp",
  disable = disabled["cmp-greek"],
})

use({
  "jc-doyle/cmp-pandoc-references",
  ft = "markdown",
  wants = "nvim-cmp",
  disable = disabled["cmp-pandoc-references"],
})

-- vim:ft=lua
