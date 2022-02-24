use {
  "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
  setup = function()
    require "configs.flow.nvim_tree.setup"
  end,
  config = function()
    require "configs.flow.nvim_tree.config"
  end,
}

use {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  config = function()
    require "configs.flow.telescope"
    require("telescope").load_extension "notify"
  end,
}

use {
  "AckslD/nvim-neoclip.lua",
  after = "telescope.nvim",
  config = function()
    require "configs.flow.telescope.ext.neoclip"
    require("telescope").load_extension "neoclip"
  end,
}

use {
  "nvim-telescope/telescope-fzf-native.nvim",
  run = "make",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "fzf"
  end,
}

use {
  "rudism/telescope-dict.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "dict"
  end,
}

use {
  "LinArcX/telescope-command-palette.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "command_palette"
  end,
}

use {
  "LinArcX/telescope-env.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "env"
  end,
}

use {
  "sudormrfbin/cheatsheet.nvim",
  requires = { "popup.nvim", "plenary.nvim" },
  config = function()
    require "configs.flow.telescope.ext.cheatsheet"
    require("telescope").load_extension "cheatsheet"
  end,
  cmd = { "Cheatsheet", "CheatsheetEdit" },
  after = "telescope.nvim",
}

use {
  "nvim-telescope/telescope-node-modules.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "node_modules"
  end,
}

use {
  "benfowler/telescope-luasnip.nvim",
  config = function()
    require("telescope").load_extension "luasnip"
  end,
  after = { "LuaSnip", "telescope.nvim" },
  disable = true,
}

use {
  "xiyaowong/telescope-emoji.nvim",
  after = "telescope.nvim",
  config = function()
    require "configs.flow.telescope.ext.emoji"
    require("telescope").load_extension "emoji"
  end,
}

use {
  "crispgm/telescope-heading.nvim",
  wants = "telescope.nvim",
  ft = { "md", "markdown" },
  config = function()
    require("telescope").load_extension "heading"
  end,
}

use {
  "dhruvmanila/telescope-bookmarks.nvim",
  after = "telescope.nvim",
  requires = { { "tami5/sqlite.lua", module = "sqlite" } },
  config = function()
    require("telescope").load_extension "bookmarks"
  end,
}

use {
  "nvim-telescope/telescope-frecency.nvim",
  after = "telescope.nvim",
  requires = { { "tami5/sqlite.lua", module = "sqlite" } },
  config = function()
    require("telescope").load_extension "frecency"
  end,
}

use {
  "TC72/telescope-tele-tabby.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "tele_tabby"
  end,
}

use {
  "cljoly/telescope-repo.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "repo"
  end,
}

use { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" }

use {
  "pagankeymaster/telescope-media-files.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "media_files"
  end,
}

use {
  "nvim-telescope/telescope-project.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "project"
  end,
}

use {
  "nvim-telescope/telescope-packer.nvim",
  after = { "packer.nvim", "telescope.nvim" },
  config = function()
    require("telescope").load_extension "packer"
  end,
}

use {
  "nvim-telescope/telescope-file-browser.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "file_browser"
  end,
}
