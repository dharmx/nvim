local present, lazy = pcall(require, "lazy")
if not present then return end

lazy.setup({
  spec = "dharmx.plug.spec",
  root = vim.fn.stdpath("data") .. "/lazy",
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
  concurrency = 50,
  dev = {
    path = os.getenv("HOME") .. "/Dotfiles/neovim",
  },
  install = {
    missing = true,
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
      disabled_plugins = {
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
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

-- vim:filetype=lua