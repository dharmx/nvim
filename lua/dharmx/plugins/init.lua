local lazypath = vim.fn.stdpath("data") .. "/plugins/lazy.nvim"
local util = require("dharmx.utils.nvim")

-- auto-clone lazy.nvim if it does not exist on install path
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

---Convenience function to disable plugins via their name.
local function exclude_and_load(items)
  items = vim.F.if_nil(items, {})
  local plugins = {}
  local spec = { plugins } -- reference: adding items to plugins will add items to spec[1]

  util.exclude(items, vim.fn.stdpath("config") .. "/lua/dharmx/plugins", function(file)
    if file == "init.lua" then return end
    -- fnamemodify("example.lua") -> "example"
    local mod_path = "dharmx.plugins." .. vim.fn.fnamemodify(file, ":r")
    table.insert(spec, { import = mod_path })
    local chunk = require(mod_path)

    for _, plugin in ipairs(chunk) do
      -- add enabled key to all found matches (plugins that should be excluded)
      if vim.tbl_contains(items, plugin[1]) then plugin.enabled = false end
      table.insert(plugins, plugin)
    end
  end)

  -- load and setup lazy so that it can start managing plugins
  require("lazy").setup({
    spec = spec,
    lockfile = vim.fn.stdpath("config") .. "/lock.json",
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
end

-- see init.vim for usage
return { exclude_and_load = exclude_and_load }
