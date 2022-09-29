local use = require("packer").use

local disabled = require("control.disabled")

use({
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  config = function()
    require("plugin.config.telescope")
    require("telescope").load_extension("notify")
  end,
  wants = "nvim-treesitter",
  module = "telescope",
  disable = disabled["telescope.nvim"],
})

use({
  "aloussase/telescope-gradle.nvim",
  config = function()
    require("telescope").load_extension("gradle")
  end,
  wants = "telescope.nvim",
  ft = "groovy",
  disable = disabled["telescope-gradle.nvim"],
})

use({
  "aloussase/telescope-maven-search",
  config = function()
    require("telescope").load_extension("maven_search")
  end,
  wants = "telescope.nvim",
  ft = "xml",
  disable = disabled["telescope-maven-search"],
})

use({
  "tom-anders/telescope-vim-bookmarks.nvim",
  config = function()
    require("telescope").load_extension("vim_bookmarks")
  end,
  after = { "vim-bookmarks", "telescope.nvim" },
  disable = disabled["telescope-vim-bookmarks.nvim"],
})

use({
  "jvgrootveld/telescope-zoxide",
  config = function()
    require("telescope").load_extension("zoxide")
  end,
  after = "telescope.nvim",
  disable = disabled["telescope-zoxide"],
})

use({
  "nvim-telescope/telescope-ui-select.nvim",
  config = function()
    require("telescope").load_extension("ui-select")
  end,
  after = "telescope.nvim",
  disable = disabled["telescope-ui-select.nvim"],
})

use({
  "nvim-telescope/telescope-github.nvim",
  config = function()
    require("telescope").load_extension("gh")
  end,
  after = "telescope.nvim",
  disable = disabled["telescope-github.nvim"],
})

use({
  "AckslD/nvim-neoclip.lua",
  after = "telescope.nvim",
  config = function()
    require("plugin.config.telescope.ext.neoclip")
    require("telescope").load_extension("neoclip")
  end,
  disable = disabled["nvim-neoclip.lua"],
})

use({
  "nvim-telescope/telescope-fzf-native.nvim",
  run = "make",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("fzf")
  end,
  disable = disabled["telescope-fzf-native.nvim"],
})

use({
  "https://code.sitosis.com/rudism/telescope-dict.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("dict")
  end,
  disable = disabled["telescope-dict.nvim"],
})

use({
  "LinArcX/telescope-command-palette.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("command_palette")
  end,
  disable = disabled["telescope-command-palette.nvim"],
})

use({
  "LinArcX/telescope-env.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("env")
  end,
  disable = disabled["telescope-env.nvim"],
})

use({
  "sudormrfbin/cheatsheet.nvim",
  wants = "popup.nvim",
  config = function()
    require("plugin.config.telescope.ext.cheatsheet")
    require("telescope").load_extension("cheatsheet")
  end,
  cmd = { "Cheatsheet", "CheatsheetEdit" },
  after = "telescope.nvim",
  disable = disabled["cheatsheet.nvim"],
})

use({
  "nvim-telescope/telescope-node-modules.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("node_modules")
  end,
  disable = disabled["telescope-node-modules.nvim"],
})

use({
  "benfowler/telescope-luasnip.nvim",
  config = function()
    require("telescope").load_extension("luasnip")
  end,
  after = { "LuaSnip", "telescope.nvim" },
  disable = disabled["telescope-luasnip.nvim"],
})

use({
  "xiyaowong/telescope-emoji.nvim",
  after = "telescope.nvim",
  config = function()
    require("plugin.config.telescope.ext.emoji")
    require("telescope").load_extension("emoji")
  end,
  disable = disabled["telescope-emoji.nvim"],
})

use({
  "crispgm/telescope-heading.nvim",
  wants = "telescope.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("heading")
  end,
  disable = disabled["telescope-heading.nvim"],
})

use({
  "dhruvmanila/telescope-bookmarks.nvim",
  after = "telescope.nvim",
  wants = "sqlite.lua",
  config = function()
    require("telescope").load_extension("bookmarks")
  end,
  disable = disabled["telescope-bookmarks.nvim"],
})

use({
  "nvim-telescope/telescope-frecency.nvim",
  after = "telescope.nvim",
  wants = "sqlite.lua",
  config = function()
    require("telescope").load_extension("frecency")
  end,
  disable = disabled["telescope-frecency.nvim"],
})

use({
  "TC72/telescope-tele-tabby.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("tele_tabby")
  end,
  disable = disabled["telescope-tele-tabby.nvim"],
})

use({
  "cljoly/telescope-repo.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("repo")
  end,
  disable = disabled["telescope-repo.nvim"],
})

use({
  "nvim-telescope/telescope-symbols.nvim",
  after = "telescope.nvim",
  disable = disabled["telescope-symbols.nvim"],
})

use({
  "dharmx/telescope-media-files.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("media_files")
  end,
  disable = disabled["telescope-media-files.nvim"],
})

use({
  "nvim-telescope/telescope-project.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("project")
  end,
  disable = disabled["telescope-project.nvim"],
})

use({
  "nvim-telescope/telescope-packer.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("packer")
  end,
  disable = disabled["telescope-packer.nvim"],
})

use({
  "nvim-telescope/telescope-bibtex.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("bibtex")
  end,
  disable = disabled["telescope-bibtex.nvim"],
})

use({
  "nvim-telescope/telescope-file-browser.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension("file_browser")
  end,
  disable = disabled["telescope-file-browser.nvim"],
})

use({
  "dharmx/telescope-cheat.nvim",
  config = function()
    require("telescope").load_extension("cheat")
  end,
  after = "telescope.nvim",
  disable = disabled["telescope-cheat.nvim"],
})

use({
  "lalitmee/browse.nvim",
  after = "telescope.nvim",
  disable = disabled["browse.nvim"],
})

-- vim:ft=lua
