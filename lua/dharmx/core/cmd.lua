-- stylua: ignore start
local util = require("dharmx.util")
local alias = util.alias

alias("LineWidthColumn", function()
  if vim.wo.colorcolumn == "0" then
    vim.wo.colorcolumn = vim.bo.textwidth .. ""
  else
    vim.wo.colorcolumn = "0"
  end
end, "Virtual column for measuring text line length.")

alias("HugoServer", function()
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

-- vim:filetype=lua
