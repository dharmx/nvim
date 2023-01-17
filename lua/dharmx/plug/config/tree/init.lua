local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end

local config = {
  ensure_installed = {
    "lua",
    "rust",
    "zig",
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
    "query",
    "bash",
    "help",
    "yaml",
    "comment",
    "make",
    "markdown_inline",
    "meson",
    "ninja",
    "commonlisp",
  },
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
