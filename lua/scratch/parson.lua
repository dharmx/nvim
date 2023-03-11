-- TODO:
-- + See https://github.com/folke/lazy.nvim/blob/main/lua/lazy/core/cache.lua#L294-L313.
-- + See http://lua-users.org/wiki/LuaModulesLoader.
-- + Add module.
-- + Add before.
-- + Add after.
-- + Add wants.
-- + Add cond.
-- + Add on.
-- + Add depends.
-- + Add keys.
-- + Add cmd.
-- + Add build.
-- + Add cmd.
-- + Add on_download.
-- + Add on_load.
--  Drop plenary.job dependency.

local M = {}

local function Task(options)
  local pipes = { stdin = vim.loop.new_pipe(), stdout = vim.loop.new_pipe(), stderr = vim.loop.new_pipe() }
  if options.before then options.before() end
  local handle, process = vim.loop.spawn(table.remove(options.cmd, 1), {
    args = #options.cmd == 0 and nil or options.cmd,
    cwd = options.directory,
    stdio = vim.tbl_values(pipes),
  }, function(code, signal)
    if options.callback then options.callback(code, signal, vim.tbl_values(pipes)) end
  end)
  local function readstd(pipe, callback)
    vim.loop.read_start(pipe, function(errors, data)
      assert(not errors, errors)
      if callback and data then callback(errors, data, { task = handle, process = process }) end
    end)
  end
  readstd(pipes.stdout, options.on_errors)
  readstd(pipes.stdout, options.on_outputs)
end

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
    new.username, new.repo = unpack(vim.split(new.name, "/", { plain = true }))
    new.location = string.format("%s/%s/%s", M._config.parson_path, new.lazy and "opt" or "start", new.repo)
    new.link = vim.F.if_nil(new.link, string.format(M._config.repo_site, new.name))
    new.installed = not not vim.loop.fs_realpath(new.location)
    new.loaded = false
    new.config = vim.F.if_nil(new.config, function() end)
    new.after_download = vim.F.if_nil(new.after_download, function() end)
    new.after_update = vim.F.if_nil(new.after_update, function() end)
    if new.installed and not new.lazy then new.config() end

    function new.load()
      vim.cmd.packadd(new.repo)
      new.loaded = true
      new.config()
    end

    function new.download()
      local config = { cmd = M._config.clone(new.link) }
      function config.callback(code, _, pipes)
        if code == 0 then
          new.installed = true
          if not M._config.quiet then vim.notify("Downloaded " .. new.repo .. ".") end
        else if not M._config.quiet then vim.notify("Download ERROR[" .. new.repo .. "]") end end
        new.after_download(new, pipes)
      end
      config.directory = vim.fn.fnamemodify(new.location, ":h")
      Task(config)
    end

    function new.update()
      local config = { cmd = M._config.pull() }
      function config.callback(code, _, pipes)
        if code == 0 then new.installed = true end
        new.after_update(new, pipes)
      end
      config.directory = new.location
      Task(config)
    end
    M._database[new.repo] = new
    return database
  end,
})

function M.setup(options)
  options = vim.F.if_nil(options, {})
  M._config = vim.tbl_deep_extend("keep", options, M._config)
  vim.fn.mkdir(M._config.parson_path .. "/opt", "p")
  vim.fn.mkdir(M._config.parson_path .. "/start", "p")
  vim.opt.packpath:append(vim.fn.fnamemodify(M._config.parson_path, ":h:h"))
end

return M
