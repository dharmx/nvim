local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end
local MainConfig = require("dharmx")

local config = {
  ensure_installed = MainConfig.tools.tree,
  sync_install = false,
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

tree.setup(config)

-- vim:filetype=lua
