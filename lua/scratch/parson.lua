local Task = require("plenary.job")
local M = {}
local OPN = {}

M._defaults = { pack_path = vim.fn.stdpath("data") .. "/site" }
M._config = M._defaults
M._db = {}

local function install(link, path)
  -- TODO: Use on_start and on_exit for tracking progress.
  Task:new({
    "git", "clone", "--depth", "1", link, path,
  }):start()
end

local function packadd(plugin)
  vim.cmd.packadd(plugin.tail)
  plugin.config()
end

function OPN.__add(self, new)
  setmetatable(new, { __call = packadd })
  new.link = vim.F.if_nil(new.link, string.format("https://github.com/%s.git", new.name))
  new.tail = vim.fn.fnamemodify(new.name, ":t")
  new.path = M._config.pack_path .. "/pack/parson/"

  if new.opt then new.path = string.format("%s/opt/%s", new.path, new.tail)
  else new.path = string.format("%s/start/%s", new.path, new.tail) end
  new.sync = vim.F.if_nil(new.sync, function() install(new.link, new.path) end)
  self._db[new.name] = new

  if new.init then new.init() end
  if new.on then vim.api.nvim_create_autocmd(new.on, {
    callback = function() packadd(new) end,
    once = true
  }) end
  return self
end

function OPN.__call(self, plugins)
  for _, plugin in ipairs(plugins) do self = OPN.__add(self, plugin) end
  return self
end

function M.sync()
  for _, plugin in pairs(M._db) do
    print("Cloning " .. plugin.tail .. "...")
    plugin.sync()
  end
end

function M.setup(options)
  options = vim.F.if_nil(options, {})
  M._config = vim.tbl_deep_extend("keep", options, M._config)
  vim.opt.packpath:append(M._config.pack_path)
end

setmetatable(M, OPN)
return M
