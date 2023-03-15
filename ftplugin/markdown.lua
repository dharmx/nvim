local util = require("dharmx.util").nvim

util.cmd("PeekOpen", function() require("peek").open() end, "Open peek window.")
util.cmd("PeekClose", function() require("peek").close() end, "Close peek window.")
vim.opt_local.wrap = false
vim.opt_local.spell = false

if vim.loop.fs_realpath(vim.loop.cwd() .. "/config.toml") then
  util.cmd("HugoCompile", ":lua vim.fn.system('hugo --minify --quiet')", "Genrate hugo website.")
  util.cmd("Hugo", function()
    if vim.g.hugo then
      vim.loop.kill(vim.g.hugo, "sigkill")
      vim.g.hugo = nil
      return
    end
    local Task = require("plenary.job")
    local task = Task:new({
      command = "hugo",
      args = { "server", "--port", "1313", "--quiet" },
      skip_validation = true,
      on_start = vim.schedule_wrap(function()
        vim.api.nvim_notify("Started Hugo.", vim.log.levels.INFO, { title = "Hugo", icon = " " })
      end),
      on_exit = vim.schedule_wrap(function(...)
        local code = select(2, ...)
        local message = "Hugo exited successfully."
        local level = vim.log.levels.INFO
        if code ~= 0 then
          message = string.format("Hugo exited with ERROR CODE %s.", code)
          level = vim.log.levels.ERROR
        end
        vim.api.nvim_notify(message, level, { title = "Hugo", icon = " " })
      end),
    })
    task:start()
    vim.g.hugo = task.pid
    vim.fn.system({ "firefox", "localhost:1313" })
  end, "Hugo watch task. Port at localhost:1313")
end
