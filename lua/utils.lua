local M = {}

function M.lsp_signdef(group, icon, text_group)
  fn.sign_define(group, {
    text = icon,
    texthl = text_group,
  })
end

function M.dashboard_vimenter()
  if api.nvim_buf_get_name(0) == "" then
    api.nvim_notify(
      [[         ⠀⢀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀   ⠀⠀⠀⣠⣾⠿⠛⠛⠛⠿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀ ⠀⠀⠀  ⣼⡿⠁⠀⠀⠀⠀⠀⠈⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⢀⣤⣶⠿⠿⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠿⠿⣶⣄⠀⠀⠀⠀⠀WELCOME  TO KRAKENVIM 
⢠⣾⡟⠁⠀⣀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⣀⠀⠈⢻⣷⡄⠀⠀⠀━━━━━━━━━━━━━━━━━━━━━
⢸⣿⠀⣴⣿⠛⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠛⣿⣆⠀⣿⡇⠀⠀⠀
⠸⣿⣆⣿⡇⠀⠀⣿⡇⠸⡿⠂⠀⠐⠿⠇⢸⣿⠀⠀⢸⣿⣼⡿⠃⠀⠀⠀Press the <Space> key
 ⠈⠻⢿⣿⣶⣤⣿⣷⣤⣤⣤⣤⣤⣤⣤⣾⣿⣤⣶⣿⡿⠟⠁⠀⠀⠀⠀   to get started.
⠀ ⠀⢀⣤⣬⣭⣭⡍⢹⣿⢹⣿⡏⣿⡏⢩⣭⣭⣥⣤⡀⠀⠀⠀⠀⠀⠀
 ⢀⣤⣬⣭⣭⡅⣿⡇⢸⣿⢸⣿⡇⣿⡇⢸⣿⢨⣤⣤⣤⣤⡀⠀⠀⠀⠀We hope you enjoy your
 ⠉⠉⠉⠉⣿⡇⣿⡇⢸⣿⢸⣿⡇⣿⡇⢸⣿⢸⣿⠉⠉⠉⠉⠀⠀⠀⠀        stay.
   ⠀⠀⣿⡇⣿⣇⢸⣿⢸⣿⡇⣿⡇⣸⣿⢸⣿⠀⠀⠀⠀⠀⠀⠀          
⠀ ⠀  ⢿⣿⣜⠿⠿⢋⣾⣿⣷⡙⠿⠿⣣⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀   ⠀⠙⠻⠿⠿⠟⠋⠀⠙⠻⠿⠿⠟⠋]],
      vim.log.levels.INFO,
      { title = "KrakenVim", icon = " " }
    )
    cmd "Dashboard"
  end
end

function M.notify(options)
  if type(options) == "string" then
    api.nvim_notify(options, vim.log.levels.INFO, {
      icon = "",
      title = "Notification",
    })
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

function M.delete_buffer()
  local buflisted = fn.getbufinfo { buflisted = 1 }
  local cur_winnr, cur_bufnr = fn.winnr(), fn.bufnr()
  if #buflisted < 2 then
    cmd "confirm qall"
    return
  end
  for _, winid in ipairs(fn.getbufinfo(cur_bufnr)[1].windows) do
    cmd(string.format("%d wincmd w", fn.win_id2win(winid)))
    cmd(cur_bufnr == buflisted[#buflisted].bufnr and "bp" or "bn")
  end
  cmd(string.format("%d wincmd w", cur_winnr))
  local is_terminal = fn.getbufvar(cur_bufnr, "&buftype") == "terminal"
  cmd(is_terminal and "bd! #" or "silent! confirm bd #")
end

function M.alias(alias, command, options)
  if not options then
    options = {}
  end
  api.nvim_add_user_command(alias, command, options)
end

function M.map(key, command, options)
  if not options then
    options = {}
  end
  require("which-key").register({
    name = options.heading or "בּ None",
    [key] = {
      "<CMD>" .. command .. "<CR>",
      options.name or "בּ None",
    },
  }, {
    mode = options.mode or "n",
    buffer = options.buffer,
    silent = options.silent or true,
    noremap = options.noremap or true,
    nowait = options.nowait or false,
  })
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
end

function M.cmp_under(entry1, entry2)
  local _, entry1_under = entry1.completion_item.label:find "^_+"
  local _, entry2_under = entry2.completion_item.label:find "^_+"
  entry1_under = entry1_under or 0
  entry2_under = entry2_under or 0
  if entry1_under > entry2_under then
    return false
  elseif entry1_under < entry2_under then
    return true
  end
end

function M.get_active_scheme()
  return require("theming.schemes." .. colorscheme)
end

function M.highlight(group, colors)
  if colors.link then
    M.link(group, colors.link)
    return
  end

  local background = colors.background or "NONE"
  local foreground = colors.foreground or "NONE"
  local decoration = colors.decoration or "NONE"
  local special = colors.decoration or "NONE"

  local prepared = string.format(
    "highlight %s guibg=%s guifg=%s gui=%s guisp=%s",
    group,
    background,
    foreground,
    decoration,
    special
  )

  cmd(prepared)
end

function M.link(from, to)
  local prepared = string.format("highlight! link %s %s", from, to)
  cmd(prepared)
end

function M.apply(options)
  local enums = require "tables.theming"
  local base = enums.base

  local theme = enums.supports.theme
  local syntax = enums.supports.syntax

  local loaded_theme = require("theming.schemes." .. options.scheme)

  local set = function(groups)
    for group, colors in pairs(groups) do
      M.highlight(group, colors)
    end
  end

  local disabled = function(plugin)
    if not options.disable then
      return false
    end

    for _, item in ipairs(options.disable) do
      if plugin == item then
        return true
      end
    end

    return false
  end

  for name, config in pairs(theme) do
    if not disabled(name) then
      set(config(loaded_theme))
    end
  end

  for name, config in pairs(syntax) do
    if not disabled(name) then
      set(config(loaded_theme.syntax))
    end
  end

  for name, config in pairs(base.syntax) do
    if not disabled(name) then
      set(config(loaded_theme.syntax))
    end
  end

  base.terminal(loaded_theme)
  set(base.ui(loaded_theme))
end

return M

-- vim:ft=lua
