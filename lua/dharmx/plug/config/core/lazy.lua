local ok, lazy = pcall(require, "lazy")
if not ok then return end
local MainConfig = require("dharmx")

local scanned = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/dharmx/plug/spec")
local specs = {}
for _, spec_file in ipairs(scanned) do
  local spec = vim.fn.fnamemodify(spec_file, ":r")
  if not vim.tbl_contains(MainConfig.disable.spec, spec) then
    local plugs = require("dharmx.plug.spec." .. spec)
    for _, plug in ipairs(plugs) do
      if not vim.tbl_contains(MainConfig.disable.plug, plug[1]) then
        table.insert(specs, plug)
      end
    end
  end
end

lazy.setup({
  spec = specs,
  root = MainConfig.lazy.root,
  lockfile = MainConfig.lazy.lock,
  concurrency = 50,
  defaults = {
    lazy = true,
  },
  dev = {
    path = MainConfig.lazy.dev,
  },
  install = {
    missing = true,
    colorscheme = { "fallback" },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = MainConfig.ui.border,
    icons = MainConfig.ui.lazy,
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
      path = MainConfig.lazy.cache,
      ttl = 3600 * 24 * 5,
      disable_events = { "VimEnter", "BufReadPre", "UIEnter" },
    },
    reset_packpath = true,
    rtp = {
      disabled_plugins = MainConfig.builtin,
    },
  },
  readme = {
    root = MainConfig.lazy.readme,
    files = { "README.md", "lua/**/README.md", ".github/README.md" },
    skip_if_doc_exists = true,
  },
})

-- vim:filetype=lua
