---@type DharmxConfigReturn
local M = {}

local U = vim.loop
local F = vim.fn
local function req(supply) return require("dharmx.supply." .. supply) end

---@type DharmxConfig
local defaults = {
  theme = "radium_dark",
  leader = " ",
  lazy = {
    install = F.stdpath("data") .. "/lazy/lazy.nvim",
    dev = vim.env.HOME .. "/Dotfiles/neovim",
    lock = F.stdpath("config") .. "/lazy-lock.json",
    root = F.stdpath("data") .. "/lazy",
    readme = F.stdpath("state") .. "/lazy/readme",
    cache = F.stdpath("cache") .. "/lazy/cache",
  },
  core = {
    option = true,
    global = true,
    map = true,
    cmd = true,
    sign = true,
    provide = true,
    autocmd = true,
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
  ui = req("ui"),
  kind = req("kind"),
  builtin = req("builtin"),
  source = req("source"),
  black = req("black"),
  disable = req("disable"),
}

---@param options DharmxConfig
function M.setup(options)
  ---@type DharmxConfig
  defaults = vim.tbl_deep_extend("keep", vim.F.if_nil(options, {}), defaults)
  setmetatable(
    defaults.lazy,
    { __call = function(lazy, item) return not item and lazy or U.fs_access(lazy[item], "RW") end }
  )
  vim.g.mapleader = defaults.leader
  M.configure(defaults.core)
  vim.cmd.colorscheme("fallback")
  require("dharmx.plug")
end

---@param core_modules CoreOptions
function M.configure(core_modules)
  if defaults._done then return end
  core_modules = vim.F.if_nil(core_modules, {})
  for core_module, state in pairs(core_modules) do
    if state then require("dharmx.core." .. core_module) end
  end
  defaults._done = true
end

setmetatable(M, { __index = function(_, key) return defaults[key] end })
return M

-- DO NOT OPEN THIS {{{
---@class SignOptions
---@field diagnostic string
---@field errors string
---@field hints string
---@field warning string
---@field info string
---@field bulb string
---@field logpoint string
---@field breakpoint string
---@field stopped string
---@field rejected string
---@field condition string

---@class SmallUIOptions
---@field virtualcolumn string
---@field scope string

---@class UIOptions
---@field border "solid"|"double"|"single"|"rounded"|"none"|"shadow"
---@field cmp_border "solid"|"double"|"single"|"rounded"|"none"|"shadow"
---@field sign SignOptions
---@field small SmallUIOptions
---@field dap table
---@field mason table
---@field lazy table
---@field bookmark table
---@field blankline table
---@field tree table
---@field undo table
---@field glance table
---@field navic table
---@field todo table
---@field fold table
---@field monark table
---@field notify table
---@field trouble table
---@field neogit table
---@field telescope table
---@field scrollbar table
---@field gitsigns table
---@field aerial table

---@class CoreOptions
---@field option boolean
---@field global boolean
---@field map boolean
---@field cmd boolean
---@field autocmd boolean
---@field provide boolean
---@field neovide boolean
---@field match boolean

---@class LspAutocmdOptions
---@field enable boolean
---@field high boolean
---@field lens boolean
---@field diag boolean
---@field bulb boolean

---@class LazyOptions
---@field install string
---@field dev string
---@field lock string
---@field root string
---@field readme string
---@field cache string

---@class LspOptions
---@field autocmd LspAutocmdOptions
---@field cmd boolean
---@field handlers boolean

---@class KindSourceOptions
---@field full table<string, string>
---@field icon table<string, string>

---@class KindOptions
---@field source KindSourceOptions
---@field type table<string, string>

---@class BlackOptions
---@field buftype string[]
---@field filetype string[]

---@class SourceOptions
---@field cmdline table[]
---@field normal table[]

---@class DisableOptions
---@field plug string[]
---@field spec string[]

---@alias BuiltinOptions string[]
---@alias ThemeOption string
---@alias LeaderOption string

---@class DharmxConfig
---@field theme ThemeOption
---@field leader LeaderOption
---@field ui UIOptions
---@field lazy LazyOptions
---@field core CoreOptions
---@field lsp LspOptions
---@field builtin BuiltinOptions
---@field source SourceOptions
---@field kind KindOptions
---@field black BlackOptions
---@field disable DisableOptions

---@alias DharmxConfigReturn { setup: fun(options?: DharmxConfig), configure: fun(modules?: CoreOptions), theme: ThemeOption, ui: UIOptions, lazy: LazyOptions, core: CoreOptions, lsp: LspOptions, kind: KindOptions, source: SourceOptions, builtin: BuiltinOptions, leader: LeaderOption, black: BlackOptions, disable: DisableOptions }
-- }}}

-- vim:filetype=lua
