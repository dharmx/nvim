local present, ts = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local nv = require("utils.neovim")
local notify = nv.notify

require("nvim-treesitter.install").prefer_git = true

local config = {
  ensure_installed = {
    "lua",
    "http",
    "java",
    "latex",
    "json",
    "python",
    "html",
    "json5",
    "markdown",
    "rasi",
    "regex",
    "scheme",
    "scss",
    "vim",
    "css",
    "toml",
    "bash",
    "help",
    "yaml",
    "comment",
    "norg",
    "make",
    "markdown_inline",
    "meson",
    "ninja",
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
  rainbow = require("plugin.config.treesitter.modules.rainbow"),
  textobjects = require("plugin.config.treesitter.modules.textobjects"),
  playground = require("plugin.config.treesitter.modules.playground"),
  query_linter = require("plugin.config.treesitter.modules.querylinter"),
  refactor = require("plugin.config.treesitter.modules.refactor"),
  matchup = require("plugin.config.treesitter.modules.matchup"),
  textsubjects = require("plugin.config.treesitter.modules.textsubjects"),
}

ts.setup(config)

require("plugin.config.treesitter.modules.autotag")

notify({
  message = "Treesitter is now enabled!",
  title = "nvim-treesitter",
  icon = "",
})

nv.ensure_treesitter_language_installed()

-- vim:ft=lua
