local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/parsers")

tree.setup({
  ensure_installed = "all",
  parser_install_dir = vim.fn.stdpath("data") .. "/parsers",
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
})

-- vim:filetype=lua
