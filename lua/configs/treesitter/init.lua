local present, ts = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require("nvim-treesitter.install").prefer_git = true

local config = {
  ensure_installed = {
    "lua",
    "vim",
    "java",
    "python",
    "bash",
    "c",
    "fish",
    "html",
    "http",
    "css",
    "javascript",
    "json",
    "json5",
    "make",
    "markdown",
    "rasi",
    "regex",
    "scss",
    "toml",
    "yaml",
    "css",
    "commonlisp",
    "comment",
    "latex",
    "norg",
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
  autotag = require "configs.treesitter.modules.autotag",
  refactor = require "configs.treesitter.modules.refactor",
  matchup = require "configs.treesitter.modules.matchup",
}

schedule(function()
  ts.setup(config)
end)

-- vim:ft=lua
