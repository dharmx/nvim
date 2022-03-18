local M = {}

local function use(plugin)
  table.insert(M, plugin)
end

use {
  "hrsh7th/nvim-cmp",
  config = function()
    require "configs.cmp"
  end,
  event = { "InsertEnter", "CmdlineEnter" },
}

use {
  "tamago324/cmp-zsh",
  after = "nvim-cmp",
  ft = "zsh",
  config = function()
    require "configs.cmp.zsh"
  end,
}

use {
  "uga-rosa/cmp-dictionary",
  after = "nvim-cmp",
  config = function()
    require "configs.cmp.dictionary"
  end,
}

use {
  "L3MON4D3/LuaSnip",
  after = "nvim-cmp",
  config = function()
    require "configs.cmp.luasnip"
  end,
}

use {
  "windwp/nvim-autopairs",
  after = "nvim-cmp",
  module = "nvim-autopairs",
  config = function()
    require "configs.cmp.autopairs"
  end,
}

use {
  "petertriho/cmp-git",
  wants = "plenary.nvim",
  config = function()
    require "configs.cmp.git"
  end,
  after = "nvim-cmp",
}

use {
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  after = { "nvim-lspconfig", "nvim-cmp" },
}

use {
  "hrsh7th/cmp-nvim-lsp-signature-help",
  after = { "nvim-cmp", "nvim-lspconfig" },
}

use { "dmitmel/cmp-cmdline-history", after = "nvim-cmp", event = "CmdlineEnter" }

use {
  "quangnguyen30192/cmp-nvim-tags",
  after = "nvim-cmp",
  ft = { "md", "markdown", "html", "xml", "javascript", "js" },
}

use {
  "David-Kunz/cmp-npm",
  after = "nvim-cmp",
  ft = "package.json",
  wants = "plenary.nvim",
}

use {
  "andersevenrud/cmp-tmux",
  after = "nvim-cmp",
}

use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }

use {
  "hrsh7th/cmp-nvim-lsp",
  after = { "nvim-lspconfig", "nvim-cmp" },
  config = function()
    require "configs.cmp.lsp"
  end,
}

use { "hrsh7th/cmp-calc", after = "nvim-cmp" }

use { "octaltree/cmp-look", after = "nvim-cmp" }

use {
  "f3fora/cmp-spell",
  after = "nvim-cmp",
}

use { "hrsh7th/cmp-omni", after = "nvim-cmp" }

use { "lukas-reineke/cmp-rg", after = "nvim-cmp" }

use {
  "ray-x/cmp-treesitter",
  wants = "nvim-cmp",
  after = "nvim-treesitter",
}

use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }

use { "mtoohey31/cmp-fish", ft = "fish", after = "nvim-cmp" }

use { "kdheepak/cmp-latex-symbols", ft = "tex", after = "nvim-cmp" }

use { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip", "nvim-cmp" } }

use { "hrsh7th/cmp-cmdline", after = "nvim-cmp", event = "CmdlineEnter" }

use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }

use { "hrsh7th/cmp-path", after = "cmp-buffer" }

return M

-- vim:ft=lua
