local enabled = __KRAKEN.plugins["completion"]

use {
  "hrsh7th/nvim-cmp",
  wants = "cmp-under-comparator",
  config = function()
    require "configs.completion"
  end,
  disable = not enabled["nvim-cmp"],
}

use {
  "lukas-reineke/cmp-under-comparator",
  module = "cmp-under-comparator",
  disable = not enabled["cmp-under-comparator"],
}

use {
  "tamago324/cmp-zsh",
  after = "nvim-cmp",
  config = function()
    require "configs.completion.zsh"
  end,
  disable = not enabled["cmp-zsh"],
}

use {
  "uga-rosa/cmp-dictionary",
  after = "nvim-cmp",
  config = function()
    require "configs.completion.dictionary"
  end,
  disable = not enabled["cmp-dictionary"],
}

use {
  "L3MON4D3/LuaSnip",
  after = "nvim-cmp",
  config = function()
    require "configs.completion.luasnip"
  end,
  disable = not enabled["LuaSnip"],
}

use {
  "windwp/nvim-autopairs",
  after = "nvim-cmp",
  module = "nvim-autopairs",
  config = function()
    require "configs.completion.autopairs"
  end,
  disable = not enabled["nvim-autopairs"],
}

use {
  "petertriho/cmp-git",
  wants = "plenary.nvim",
  config = function()
    require "configs.completion.git"
  end,
  after = "nvim-cmp",
  disable = not enabled["cmp-git"],
}

use { "hrsh7th/cmp-emoji", after = "nvim-cmp", disable = not enabled["cmp-emoji"] }
use { "octaltree/cmp-look", after = "nvim-cmp", disable = not enabled["cmp-look"] }
use { "hrsh7th/cmp-calc", after = "nvim-cmp", disable = not enabled["cmp-calc"] }
use { "f3fora/cmp-spell", after = "nvim-cmp", disable = not enabled["cmp-spell"] }
use { "hrsh7th/cmp-omni", after = "nvim-cmp", disable = not enabled["cmp-omni"] }
use { "lukas-reineke/cmp-rg", after = "nvim-cmp", disable = not enabled["cmp-rg"] }

use { "ray-x/cmp-treesitter", after = { "nvim-cmp", "nvim-treesitter" }, disable = not enabled["cmp-treesitter"] }
use {
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  after = { "nvim-lspconfig", "nvim-cmp" },
  disable = not enabled["cmp-nvim-lsp-document-symbol"],
}
use {
  "hrsh7th/cmp-nvim-lsp-signature-help",
  after = { "nvim-cmp", "nvim-lspconfig" },
  disable = not enabled["cmp-nvim-lsp-signature-help"],
}

use { "hrsh7th/cmp-nvim-lua", wants = "nvim-cmp", ft = "lua", disable = not enabled["cmp-nvim-lua"] }
use {
  "dmitmel/cmp-cmdline-history",
  wants = "nvim-cmp",
  event = "CmdlineEnter",
  disable = not enabled["cmp-cmdline-history"],
}
use { "mtoohey31/cmp-fish", ft = "fish", wants = "nvim-cmp", ft = "fish", disable = not enabled["cmp-fish"] }
use {
  "quangnguyen30192/cmp-nvim-tags",
  wants = "nvim-cmp",
  ft = { "md", "markdown", "html", "xml", "javascript", "js" },
  disable = not enabled["nvim-cmp"],
}
use {
  "David-Kunz/cmp-npm",
  wants = { "plenary.nvim", "nvim-cmp" },
  ft = "package.json",
  disable = not enabled["cmp-npm"],
}
use {
  "andersevenrud/cmp-tmux",
  wants = "nvim-cmp",
  ft = { "sh", "bash", "zsh", "fish", "conf" },
  disable = not enabled["cmp-tmux"],
}
use { "kdheepak/cmp-latex-symbols", ft = "tex", wants = "nvim-cmp", disable = not enabled["cmp-latex-symbols"] }
use { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip", "nvim-cmp" }, disable = not enabled["cmp_luasnip"] }
use { "hrsh7th/cmp-cmdline", event = "CmdlineEnter", disable = not enabled["cmp-cmdline"] }
use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua", disable = not enabled["cmp-nvim-lsp"] }
use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp", disable = not enabled["cmp-buffer"] }
use { "hrsh7th/cmp-path", after = "cmp-buffer", disable = not enabled["cmp-path"] }
