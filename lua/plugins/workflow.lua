local enabled = __KRAKEN.plugins["workflow"]

use {
  "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
  setup = function()
    require "configs.workflow.nvim_tree.setup"
  end,
  config = function()
    require "configs.workflow.nvim_tree.config"
  end,
  disable = not enabled["nvim-tree.lua"],
}

use {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  config = function()
    require "configs.workflow.telescope"
    require("telescope").load_extension "notify"
  end,
  disable = not enabled["telescope.nvim"],
}

use {
  "AckslD/nvim-neoclip.lua",
  after = "telescope.nvim",
  config = function()
    require "configs.workflow.telescope.extensions.neoclip"
    require("telescope").load_extension "neoclip"
  end,
  disable = not enabled["nvim-neoclip.lua"],
}

use {
  "nvim-telescope/telescope-fzf-native.nvim",
  run = "make",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "fzf"
  end,
  disable = not enabled["telescope-fzf-native.nvim"],
}

use {
  "https://code.sitosis.com/rudism/telescope-dict.nvim.git",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "dict"
  end,
  disable = not enabled["telescope-dict.nvim"],
}

use {
  "LinArcX/telescope-command-palette.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "command_palette"
  end,
  disable = not enabled["telescope-command-palette.nvim"],
}

use {
  "LinArcX/telescope-env.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "env"
  end,
  disable = not enabled["telescope-env.nvim"],
}

use {
  "sudormrfbin/cheatsheet.nvim",
  requires = { "popup.nvim", "plenary.nvim" },
  config = function()
    require "configs.workflow.telescope.extensions.cheatsheet"
    require("telescope").load_extension "cheatsheet"
  end,
  cmd = { "Cheatsheet", "CheatsheetEdit" },
  after = "telescope.nvim",
  disable = not enabled["cheatsheet.nvim"],
}

use {
  "nvim-telescope/telescope-node-modules.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "node_modules"
  end,
  disable = not enabled["telescope-node-modules.nvim"],
}

use {
  "benfowler/telescope-luasnip.nvim",
  config = function()
    require("telescope").load_extension "luasnip"
  end,
  after = { "LuaSnip", "telescope.nvim" },
  disable = not enabled["telescope-luasnip.nvim"] and __KRAKEN.plugins["completion"]["cmp_luasnip"],
}

use {
  "xiyaowong/telescope-emoji.nvim",
  after = "telescope.nvim",
  config = function()
    require "configs.workflow.telescope.extensions.emoji"
    require("telescope").load_extension "emoji"
  end,
  disable = not enabled["telescope-emoji.nvim"],
}

use {
  "crispgm/telescope-heading.nvim",
  wants = "telescope.nvim",
  ft = { "md", "markdown" },
  config = function()
    require("telescope").load_extension "heading"
  end,
  disable = not enabled["telescope-heading.nvim"],
}

use {
  "dhruvmanila/telescope-bookmarks.nvim",
  after = "telescope.nvim",
  wants = "sqlite.lua",
  config = function()
    require("telescope").load_extension "bookmarks"
  end,
  disable = not enabled["telescope-bookmarks.nvim"],
}

use {
  "nvim-telescope/telescope-frecency.nvim",
  after = "telescope.nvim",
  wants = "sqlite.lua",
  config = function()
    require("telescope").load_extension "frecency"
  end,
  disable = not enabled["telescope-frecency.nvim"],
}

use {
  "TC72/telescope-tele-tabby.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "tele_tabby"
  end,
  disable = not enabled["telescope-tele-tabby.nvim"],
}

use {
  "cljoly/telescope-repo.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "repo"
  end,
  disable = not enabled["telescope-repo.nvim"],
}

use {
  "nvim-telescope/telescope-symbols.nvim",
  after = "telescope.nvim",
  disable = not enabled["telescope-symbols.nvim"],
}

use {
  "pagankeymaster/telescope-media-files.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "media_files"
  end,
  disable = not enabled["telescope-media-files.nvim"],
}

use {
  "nvim-telescope/telescope-project.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "project"
  end,
  disable = not enabled["telescope-project.nvim"],
}

use {
  "nvim-telescope/telescope-packer.nvim",
  after = { "packer.nvim", "telescope.nvim" },
  config = function()
    require("telescope").load_extension "packer"
  end,
  disable = not enabled["telescope-packer.nvim"],
}

use {
  "nvim-telescope/telescope-file-browser.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "file_browser"
  end,
  disable = not enabled["telescope-file-browser.nvim"],
}

use {
  "phaazon/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopChar1", "HopChar2", "HopPattern" },
  as = "hop",
  config = function()
    require "configs.workflow.hop"
  end,
  disable = not enabled["hop.nvim"],
}

use {
  "Pocco81/AutoSave.nvim",
  cmd = { "ASOn", "ASOff", "ASToggle" },
  config = function()
    require "configs.workflow.autosave"
  end,
  disable = not enabled["AutoSave.nvim"],
}

use { "Shatur/neovim-session-manager", cmd = "SessionManager", disable = not enabled["neovim-session-manager"] }

use { "andymass/vim-matchup", opt = true, disable = not enabled["vim-matchup"] }

use { "mbbill/undotree", opt = true, disable = not enabled["undotree"] } 

use {
  "max397574/better-escape.nvim", 
  opt = true,
  disable = not enabled["better-escape.nvim"]
}

use {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "ToggleTermToggleAll" },
  disable = not enabled["toggleterm.nvim"],
}

use { "folke/which-key.nvim", disable = not enabled["which-key.nvim"] }
