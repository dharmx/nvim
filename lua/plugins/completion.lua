local enabled = __KRAKEN.plugins["completion"]

use {
  "hrsh7th/nvim-cmp",
  wants = "cmp-under-comparator",
  config = function()
    require "configs.completion"
  end,
  disable = not enabled["nvim_cmp"],
}

use {
  "lukas-reineke/cmp-under-comparator",
  module = "cmp-under-comparator",
  disable = not enabled["cmp_under_comparator"],
}

use {
  "tamago324/cmp-zsh",
  wants = "nvim-cmp",
  ft = "zsh",
  config = function()
    require "configs.completion.cmp_zsh"
  end,
  disable = not enabled["cmp_zsh"],
}

use {
  "uga-rosa/cmp-dictionary",
  after = "nvim-cmp",
  config = function()
    require "configs.completion.cmp_dictionary"
  end,
  disable = not enabled["cmp_dictionary"],
}

use {
  "L3MON4D3/LuaSnip",
  after = "nvim-cmp",
  config = function()
    require "configs.completion.LuaSnip"
  end,
  disable = not enabled["LuaSnip"],
}

use {
  "windwp/nvim-autopairs",
  after = "nvim-cmp",
  module = "nvim-autopairs",
  config = function()
    require "configs.completion.nvim_autopairs"
  end,
  disable = not enabled["nvim_autopairs"],
}

use {
  "petertriho/cmp-git",
  wants = "plenary.nvim",
  config = function()
    require "configs.completion.cmp_git"
  end,
  after = "nvim-cmp",
  disable = not enabled["cmp_git"],
}

use {
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  after = { "nvim-lspconfig", "nvim-cmp" },
  disable = not enabled["cmp_nvim_lsp_document_symbol"],
}

use {
  "hrsh7th/cmp-nvim-lsp-signature-help",
  after = { "nvim-cmp", "nvim-lspconfig" },
  disable = not enabled["cmp_nvim_lsp_signature_help"],
}

use {
  "dmitmel/cmp-cmdline-history",
  wants = "nvim-cmp",
  event = "CmdlineEnter",
  disable = not enabled["cmp_cmdline_history"],
}

use {
  "quangnguyen30192/cmp-nvim-tags",
  wants = "nvim-cmp",
  ft = { "md", "markdown", "html", "xml", "javascript", "js" },
  disable = not enabled["cmp_nvim_tags"],
}

use {
  "David-Kunz/cmp-npm",
  wants = { "plenary.nvim", "nvim-cmp" },
  ft = "package.json",
  disable = not enabled["cmp_npm"],
}

use {
  "andersevenrud/cmp-tmux",
  wants = "nvim-cmp",
  ft = { "sh", "bash", "zsh", "fish", "conf" },
  disable = not enabled["cmp_tmux"],
}

use { "hrsh7th/cmp-emoji", after = "nvim-cmp", disable = not enabled["cmp_emoji"] }
use { "octaltree/cmp-look", after = "nvim-cmp", disable = not enabled["cmp_look"] }
use { "hrsh7th/cmp-calc", after = "nvim-cmp", disable = not enabled["cmp_calc"] }
use { "f3fora/cmp-spell", after = "nvim-cmp", disable = not enabled["cmp_spell"] }
use { "hrsh7th/cmp-omni", after = "nvim-cmp", disable = not enabled["cmp_omni"] }
use { "lukas-reineke/cmp-rg", after = "nvim-cmp", disable = not enabled["cmp_rg"] }
use { "ray-x/cmp-treesitter", after = { "nvim-cmp", "nvim-treesitter" }, disable = not enabled["cmp_treesitter"] }
use { "hrsh7th/cmp-nvim-lua", wants = "nvim-cmp", ft = "lua", disable = not enabled["cmp_nvim_lua"] }
use { "mtoohey31/cmp-fish", ft = "fish", wants = "nvim-cmp", ft = "fish", disable = not enabled["cmp_fish"] }
use { "kdheepak/cmp-latex-symbols", ft = "tex", wants = "nvim-cmp", disable = not enabled["cmp_latex_symbols"] }
use { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip", "nvim-cmp" }, disable = not enabled["cmp_luasnip"] }
use { "hrsh7th/cmp-cmdline", event = "CmdlineEnter", disable = not enabled["cmp_cmdline"] }
use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua", disable = not enabled["cmp_nvim_lsp"] }
use { "hrsh7th/cmp-buffer", after = "nvim-cmp", disable = not enabled["cmp_buffer"] }
use { "hrsh7th/cmp-path", after = "cmp-buffer", disable = not enabled["cmp_path"] }
