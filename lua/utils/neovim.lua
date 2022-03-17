local M = {}

function M.notify(options)
  if type(options) == "string" then
    api.nvim_notify(options, vim.log.levels.INFO, { icon = "", title = "Notification" })
    return
  end

  local forced = vim.tbl_extend("force", {
    message = "This is a sample notification.",
    icon = "",
    title = "Notification",
    level = vim.log.levels.INFO,
  }, options or {})
  api.nvim_notify(forced.message, forced.level, { title = forced.title, icon = forced.icon })
end

function M.abbrev(buffer, command, expression)
  local formatted = string.format("cnoreabbrev %s %s %s", expression and "<expr>" or "", buffer, command)
  cmd(formatted)
end

function M.alias(alias, command, options)
  if not options then
    options = {}
  end
  api.nvim_add_user_command(alias, command, options)
end

function M.autocmd(events, command, options)
  if not options then
    options = {}
  end
  local autocmd_opts = {}

  autocmd_opts[type(command) == "string" and "command" or "callback"] = command
  if not options.buffer then
    autocmd_opts.pattern = not options.patterns and "*" or options.patterns
  else
    autocmd_opts.buffer = options.buffer or options.bufnr
  end

  if options.group then
    autocmd_opts.group = options.group
  end
  api.nvim_create_autocmd(events, autocmd_opts)
  return options.group
end

function M.augroup(name, autocmds, clear)
  clear = clear == false and false or true
  local append = M.autocmd
  local group = api.nvim_create_augroup(name, { clear = clear })
  for _, autocmd in ipairs(autocmds) do
    if not autocmd.options then
      autocmd.options = {}
    end
    autocmd.options.group = group
    append(autocmd.events, autocmd.command, autocmd.options)
  end
  return group
end

return M

-- vim:ft=lua
