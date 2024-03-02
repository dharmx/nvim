vim.cmd.colorscheme("radium")
require("core.commands")
require("core.options")
require("core.mappings")

local data = vim.fn.stdpath("data")
local lazypath = data .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- LAZY {{{
require("lazy").setup("plugins", {
  root = vim.fn.fnamemodify(lazypath, ":h"),
  defaults = { lazy = true },
  dev = { path = vim.env.HOME .. "/Projects/neovim" },
  install = {
    missing = true,
    colorscheme = { "radium" },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = "solid",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "鈴 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = { "●", "➜", "★", "‒" },
    },
    throttle = 20,
  },
  diff = {
    cmd = "diffview.nvim",
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath("cache") .. "/lazy/cache",
      ttl = 3600 * 24 * 5,
      disable_events = { "VimEnter", "BufReadPre", "UIEnter" },
    },
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "netrw",
        "matchparen",
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "bugreport",
        "tutor_mode_plugin",
        "fzf",
        "sleuth",
      },
    },
  },
  readme = {
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md", ".github/README.md" },
    skip_if_doc_exists = true,
  },
})
-- }}}

require("scratch.ethos").setup()
