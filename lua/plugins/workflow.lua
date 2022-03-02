local enabled = __KRAKEN.plugins["workflow"]

use {
  "tweekmonster/haunted.vim",
  cmd = "Haunt",
  disable = not enabled["haunted_vim"],
}

use {
  "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
  setup = function()
    require "configs.workflow.nvim_tree_lua.setup"
  end,
  config = function()
    require "configs.workflow.nvim_tree_lua.config"
  end,
  disable = not enabled["nvim_tree_lua"],
}

use {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  config = function()
    require "configs.workflow.telescope_nvim"
    require("telescope").load_extension "notify"
  end,
  disable = not enabled["telescope_nvim"],
}

use {
  "nvim-telescope/telescope-ui-select.nvim",
  config = function()
    require("telescope").load_extension "ui-select"
  end,
  disable = not enabled["telescope_ui_select_nvim"],
}
use {
  "nvim-telescope/telescope-smart-history.nvim",
  config = function()
    require("telescope").load_extension "smart_history"
  end,
  wants = "sqlite.lua",
  disable = not enabled["telescope_smart_history_nvim"],
}

use {
  "nvim-telescope/telescope-arecibo.nvim",
  rocks = { "openssl", "lua-http-parser" },
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "arecibo"
  end,
  disable = not enabled["telescope_arecibo_nvim"],
}

use {
  "AckslD/nvim-neoclip.lua",
  after = "telescope.nvim",
  config = function()
    require "configs.workflow.telescope_nvim.extensions.neoclip"
    require("telescope").load_extension "neoclip"
  end,
  disable = not enabled["nvim_neoclip_lua"],
}

use {
  "nvim-telescope/telescope-fzf-native.nvim",
  run = "make",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "fzf"
  end,
  disable = not enabled["telescope_fzf_native_nvim"],
}

use {
  "https://code.sitosis.com/rudism/telescope-dict.nvim.git",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "dict"
  end,
  disable = not enabled["telescope_dict_nvim"],
}

use {
  "LinArcX/telescope-command-palette.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "command_palette"
  end,
  disable = not enabled["telescope_command_palette_nvim"],
}

use {
  "LinArcX/telescope-env.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "env"
  end,
  disable = not enabled["telescope_env_nvim"],
}

use {
  "sudormrfbin/cheatsheet.nvim",
  requires = { "popup.nvim", "plenary.nvim" },
  config = function()
    require "configs.workflow.telescope_nvim.extensions.cheatsheet"
    require("telescope").load_extension "cheatsheet"
  end,
  cmd = { "Cheatsheet", "CheatsheetEdit" },
  after = "telescope.nvim",
  disable = not enabled["cheatsheet_nvim"],
}

use {
  "nvim-telescope/telescope-node-modules.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "node_modules"
  end,
  disable = not enabled["telescope_node_modules_nvim"],
}

use {
  "benfowler/telescope-luasnip.nvim",
  config = function()
    require("telescope").load_extension "luasnip"
  end,
  after = { "LuaSnip", "telescope.nvim" },
  disable = not enabled["telescope_luasnip_nvim"] and __KRAKEN.plugins["completion"]["cmp_luasnip"],
}

use {
  "xiyaowong/telescope-emoji.nvim",
  after = "telescope.nvim",
  config = function()
    require "configs.workflow.telescope_nvim.extensions.emoji"
    require("telescope").load_extension "emoji"
  end,
  disable = not enabled["telescope_emoji_nvim"],
}

use {
  "crispgm/telescope-heading.nvim",
  wants = "telescope.nvim",
  ft = { "md", "markdown" },
  config = function()
    require("telescope").load_extension "heading"
  end,
  disable = not enabled["telescope_heading_nvim"],
}

use {
  "dhruvmanila/telescope-bookmarks.nvim",
  after = "telescope.nvim",
  wants = "sqlite.lua",
  config = function()
    require("telescope").load_extension "bookmarks"
  end,
  disable = not enabled["telescope_bookmarks_nvim"],
}

use {
  "nvim-telescope/telescope-frecency.nvim",
  after = "telescope.nvim",
  wants = "sqlite.lua",
  config = function()
    require("telescope").load_extension "frecency"
  end,
  disable = not enabled["telescope_frecency_nvim"],
}

use {
  "TC72/telescope-tele-tabby.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "tele_tabby"
  end,
  disable = not enabled["telescope_tele_tabby_nvim"],
}

use {
  "cljoly/telescope-repo.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "repo"
  end,
  disable = not enabled["telescope_repo_nvim"],
}

use {
  "nvim-telescope/telescope-symbols.nvim",
  after = "telescope.nvim",
  disable = not enabled["telescope_symbols_nvim"],
}

use {
  "pagankeymaster/telescope-media-files.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "media_files"
  end,
  disable = not enabled["telescope_media_files_nvim"],
}

use {
  "nvim-telescope/telescope-project.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "project"
  end,
  disable = not enabled["telescope_project_nvim"],
}

use {
  "nvim-telescope/telescope-packer.nvim",
  after = { "packer.nvim", "telescope.nvim" },
  config = function()
    require("telescope").load_extension "packer"
  end,
  disable = not enabled["telescope_packer_nvim"],
}

use {
  "nvim-telescope/telescope-file-browser.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "file_browser"
  end,
  disable = not enabled["telescope_file_browser_nvim"],
}

use {
  "phaazon/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopChar1", "HopChar2", "HopPattern" },
  as = "hop",
  config = function()
    require "configs.workflow.hop_nvim"
  end,
  disable = not enabled["hop_nvim"],
}

use {
  "Pocco81/AutoSave.nvim",
  cmd = { "ASOn", "ASOff", "ASToggle" },
  config = function()
    require "configs.workflow.AutoSave_nvim"
  end,
  disable = not enabled["AutoSave_nvim"],
}

use { "Shatur/neovim-session-manager", cmd = "SessionManager", disable = not enabled["neovim_session_manager"] }

use { "andymass/vim-matchup", opt = true, disable = not enabled["vim_matchup"] }

use { "mbbill/undotree", opt = true, disable = not enabled["undotree"] }

use {
  "max397574/better-escape.nvim",
  opt = true,
  disable = not enabled["better_escape_nvim"],
}

use {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "ToggleTermToggleAll" },
  disable = not enabled["toggleterm_nvim"],
}

use {
  "folke/which-key.nvim",
  config = function()
    require "configs.workflow.which_key_nvim"
  end,
  disable = not enabled["which_key_nvim"],
}
