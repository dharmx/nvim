local util = require("dharmx.util").nvim

util.cmd("PeekOpen", function() require("peek").open() end, { desc = "Open peek window." })
util.cmd("PeekClose", function() require("peek").close() end, { desc = "Close peek window." })
util.cmd("HugoServer", function()
  if _G.HUGO_JOBS then
    local SIGKILL = 9
    ---@diagnostic disable-next-line: deprecated
    table.foreachi(_G.HUGO_JOBS, function(_, job) vim.loop.kill(job.pid, SIGKILL) end)
    _G.HUGO_JOBS = nil
    return
  end

  local Job = require("plenary.job")
  local path = vim.fn.bufname()
  if vim.fn.fnamemodify(path, ":t") == "config.toml" then
    local hugo = Job:new({
      "hugo",
      "server",
      cwd = vim.fn.fnamemodify(path, ":h"),
    })
    hugo:start()
    _G.HUGO_JOBS = _G.HUGO_JOBS and table.insert(_G.HUGO_JOBS, hugo) or { hugo }
  end
end, "Launch/Stop Hugo live server.")

vim.opt_local.wrap = true
vim.opt_local.spell = true
