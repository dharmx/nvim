local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then return end

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
  context_commentstring = { enable = true, enable_autocmd = false },
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

vim.loop.fs_scandir(
  vim.fn.stdpath("config") .. "/lua/dharmx/plug/config/tree/extra",
  vim.schedule_wrap(function(errors, userdata)
    if errors then
      treesitter.setup(config)
      return
    end
    while true do
      local name, category = vim.loop.fs_scandir_next(userdata)
      if not name then break end
      config[name] = require("dharmx.plug.config.tree.extra." .. vim.fn.fnamemodify(name, ":r"))
    end
  end)
)

-- vim:filetype=lua
