local M = {}

local defaults = {
  _done = false,
  lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
  theme = "radium_dark",
  core = {
    option = true,
    global = true,
    map = true,
    cmd = false,
    autocmd = false,
    provide = true,
    match = false,
    neovide = false,
  },
  lsp = {
    autocmd = {
      enable = false,
      high = false,
      lens = false,
      diag = false,
      bulb = false,
    },
    cmd = true,
    handlers = true,
  },
  sign = {
    diagnostic = "",
    errors = "",
    hints = "",
    warning = "",
    info = "",
    bulb = "",
  },
  kind = require("dharmx.list.kind"),
  builtin = require("dharmx.list.builtin"),
  source = require("dharmx.list.source"),
}

function M.setup(options)
  defaults = vim.tbl_deep_extend("keep", vim.F.if_nil(options, {}), defaults)
  M.configure(defaults.core)
  require("dharmx.plug")
end

function M.configure(modules)
  modules = vim.F.if_nil(modules, {})
  if defaults._done then return end
  for core_module, state in pairs(modules) do
    if state then require("dharmx.core." .. core_module) end
  end
  defaults._done = true
end

setmetatable(M, { __index = function(_, key) return defaults[key] end })
return M

-- vim:filetype=lua
