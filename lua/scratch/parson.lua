local M = {}
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/plugins/plenary.nvim") -- need to drop this
local Task = require("plenary.job")

M._defaults = {
  parson_path = vim.fn.stdpath("data") .. "/site/pack/parson",
  repo_site = "https://github.com/%s.git",
  clone = function(link, location) return { "git", "clone", "--depth=1", "--recurse-submodules", "--shallow-submodules", link, location } end,
  pull = function(location) return { "git", "pull", "--recurse-submodules", "--update-shallow", location } end,
  quiet = false,
}
M._config = M._defaults
M._database = setmetatable({}, {
  __add = function(database, new)
    new.name = vim.F.if_nil(new.name, table.remove(new, 1))
    new.lazy = vim.F.if_nil(new.lazy, false)
    new.config = vim.F.if_nil(new.config, function() end)
    new.build = vim.F.if_nil(new.build, function() end)
    new.username, new.repo = unpack(vim.split(new.name, "/", { plain = true }))
    new.location = string.format("%s/%s/%s", M._config.parson_path, new.lazy and "opt" or "start", new.repo)
    new.link = vim.F.if_nil(new.link, string.format(M._config.repo_site, new.name))
    new.installed = not not vim.loop.fs_realpath(new.location)
    new.loaded = false
    new.on_download_begin = vim.F.if_nil(new.on_download_begin, function() end)
    new.on_download_end = vim.F.if_nil(new.on_download_end, function() end)
    new.on_update = vim.F.if_nil(new.on_update, function() end)
    new.on_load = vim.F.if_nil(new.on_load, function() end)
    if new.installed and not new.lazy then new.config() end
    function new.load()
      vim.cmd.packadd(new.repo)
      new.loaded = true
      new.on_load(new)
      new.config()
    end
    function new.download()
      local config = M._config.clone(new.link)
      function config.on_start()
        if not M._config.quiet then vim.notify("Started downloading " .. new.repo .. "...") end
        new.on_download_begin(new)
      end
      function config.on_exit(task, code, _)
        if code == 0 then
          new.installed = true
          if not M._config.quiet then vim.notify("Downloaded " .. new.repo .. ".") end
        else
          if not M._config.quiet then vim.notify("Download ERROR[" .. new.repo .. "]") end
        end
        new.build(new)
        new.on_download_end(new, task)
      end
      config.cwd = vim.fn.fnamemodify(new.location, ":h")
      config.skip_validation = true
      Task:new(config):start()
    end
    function new.update()
      local config = M._config.pull()
      function config.on_exit(task, code, _)
        if code == 0 then new.installed = true end
        new.on_update(new, task)
      end
      config.cwd = new.location
      config.skip_validation = true
      Task:new(config):start()
    end
    M._database[new.repo] = new
    return database
  end,
  __call = function(database, action)
    if action then
      local items = {}
      for _, plugin in pairs(database) do table.insert(items, plugin[action]) end
      return items
    end
    return database
  end,
})

local function mkparents(path)
  local directory = vim.fn.fnamemodify(path, ":p")
  if directory:find("%l+://") == 1 then return end
  if vim.fn.isdirectory(directory) == 0 then vim.fn.mkdir(directory, "p") end
end

function M.setup(options)
  options = vim.F.if_nil(options, {})
  M._config = vim.tbl_deep_extend("keep", options, M._config)
  mkparents(M._config.parson_path .. "/opt")
  mkparents(M._config.parson_path .. "/start")
  vim.opt.packpath:append(vim.fn.fnamemodify(M._config.parson_path, ":h:h"))
end

return M
