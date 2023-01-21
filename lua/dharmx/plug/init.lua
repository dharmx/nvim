local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not lazypath then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function exclude(items)
  items = vim.F.if_nil(items, {})
  local spec = {}
  local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/dharmx/plug/spec")
  for _, file in ipairs(files) do
    local chunk = require("dharmx.plug.spec." .. vim.fn.fnamemodify(file, ":r"))
    for _, plug in ipairs(chunk) do
      if vim.tbl_contains(items, plug[1]) then plug.enabled = false end
      table.insert(spec, plug)
    end
  end

  require("lazy").setup({
    spec = spec,
    root = vim.fn.fnamemodify(lazypath, ":h"),
    concurrency = 50,
    defaults = { lazy = true },
    dev = { path = vim.env.HOME .. "/Dotfiles/neovim" },
    install = {
      missing = true,
      colorscheme = { "fallback" },
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
end

return { exclude = exclude }

-- vim:filetype=lua
