local present, ts = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require("nvim-treesitter.install").prefer_git = true

local config = {
  ensure_installed = {
    "lua",
    "http",
    "java",
    "json",
    "json5",
    "markdown",
    "rasi",
    "regex",
    "scss",
    "css",
    "toml",
    "yaml",
    "comment",
    "norg",
    "commonlisp",
  },
  sync_installed = false,
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  rainbow = require "configs.treesitter.modules.rainbow",
  textobjects = require "configs.treesitter.modules.textobjects",
  playground = require "configs.treesitter.modules.playground",
  query_linter = require "configs.treesitter.modules.querylinter",
  refactor = require "configs.treesitter.modules.refactor",
  matchup = require "configs.treesitter.modules.matchup",
  textsubjects = require "configs.treesitter.modules.textsubjects",
}

ts.setup(config)

require "configs.treesitter.modules.autotag"

notify {
  message = "Treesitter is now enabled!",
  title = "nvim-treesitter",
  icon = "",
}

neovim.ensure_treesitter_language_installed()

-- vim:ft=lua
