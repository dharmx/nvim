local function alias(name, cmd, opts) vim.api.nvim_create_user_command(name, cmd, vim.F.if_nil(opts, {})) end

alias("LineWidthColumn", function()
  if vim.wo.colorcolumn == "0" then
    vim.wo.colorcolumn = vim.bo.textwidth .. ""
  else
    vim.wo.colorcolumn = "0"
  end
end, {
  desc = "Virtual column for measuring text line length.",
})

alias("HugoServer", function()
  if _G.HUGO_JOBS then
    local SIGKILL = 9
    table.foreachi(_G.HUGO_JOBS, function(_, job) vim.loop.kill(job.pid, SIGKILL) end)
    _G.HUGO_JOBS = nil
    return
  end

  local path = vim.fn.bufname()
  if vim.fn.fnamemodify(path, ":t") == "config.toml" then
    local hugo = require("plenary.job"):new({
      "hugo",
      "server",
      cwd = vim.fn.fnamemodify(path, ":h"),
    })
    hugo:start()
    _G.HUGO_JOBS = _G.HUGO_JOBS and table.insert(_G.HUGO_JOBS, hugo) or { hugo }
  end
end, {
  desc = "Launch/Stop Hugo live server.",
})

-- vim:filetype=lua
