local ok, lazy = pcall(require, "lazy")
if not ok then return end
local config = require("dharmx")

lazy.setup({
  spec = "dharmx.plug.spec",
  root = config.pacman.root,
  lockfile = config.pacman.lock,
  concurrency = 50,
  dev = {
    path = config.pacman.dev,
  },
  install = {
    missing = true,
    colorscheme = { "fallback" },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = config.ui.border,
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
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    throttle = 20,
  },
  diff = {
    cmd = "diffview.nvim",
  },
  checker = {
    enabled = false,
    concurrency = 50,
    notify = true,
    frequency = 3600,
  },
  change_detection = {
    enabled = true,
    notify = true,
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
      disabled_plugins = config.builtin,
    },
  },
  readme = {
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md", ".github/README.md" },
    skip_if_doc_exists = true,
  },
})

-- vim:filetype=lua
