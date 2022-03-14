local M = {}

local function use(plugin)
  M[plugin[1]] = plugin
end

use {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  wants = "plenary.nvim",
  config = function()
    require "configs.telescope"
    require("telescope").load_extension "notify"
  end,
  module = "telescope"
}

use {
  "nvim-telescope/telescope-ui-select.nvim",
  config = function()
    require("telescope").load_extension "ui-select"
  end,
  after = "telescope.nvim",
}

use {
  "nvim-telescope/telescope-arecibo.nvim",
  rocks = { "openssl", "lua-http-parser" },
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "arecibo"
  end,
}

use {
  "AckslD/nvim-neoclip.lua",
  after = "telescope.nvim",
  config = function()
    require "configs.telescope.extensions.neoclip"
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
  "https://code.sitosis.com/rudism/telescope-dict.nvim",
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
  wants = { "popup.nvim", "plenary.nvim" },
  config = function()
    require "configs.telescope.extensions.cheatsheet"
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
}

use {
  "xiyaowong/telescope-emoji.nvim",
  after = "telescope.nvim",
  config = function()
    require "configs.telescope.extensions.emoji"
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
  wants = "sqlite.lua",
  config = function()
    require("telescope").load_extension "bookmarks"
  end,
}

use {
  "nvim-telescope/telescope-frecency.nvim",
  after = "telescope.nvim",
  wants = "sqlite.lua",
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

use {
  "pagankeymaster/telescope-cheat.nvim",
  config = function()
    require("telescope").load_extension "cheat"
  end,
  after = "telescope.nvim",
}

use {
  "lalitmee/browse.nvim",
  after = "telescope.nvim",
}

return M

-- vim:ft=lua
