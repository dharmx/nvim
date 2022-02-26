_ = require "settings.commands"
cmd("colorscheme " .. __KRAKEN.theme.colorscheme)
vim.o.background = __KRAKEN.theme.background
vim.env.FZF_DEFAULT_OPTS =
  "--layout=reverse --prompt ' ' --pointer '->' --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

local function assign(operation, items)
  for option, value in pairs(items) do
    local updated = value
    if operation == "append" then
      updated = vim.opt[option]:append(value)
    elseif operation == "prepend" then
      updated = vim.opt[option]:prepend(value)
    elseif operation == "remove" then
      updated = vim.opt[option]:remove(value)
    end
    vim.opt[option] = updated
  end
end

for operation, items in pairs(__KRAKEN.options) do
  assign(operation, items)
end

for global, value in pairs(__KRAKEN.globals) do
  vim.g[global] = value
end

for plugin, disabled in pairs(__KRAKEN.builtins) do
  if disabled then
    vim.g["loaded_" .. plugin] = 1
  end
end

local autocmds = require "settings.autocmds"
for autocmd, enabled in pairs(__KRAKEN.autocmds) do
  if enabled then
    autocmds[autocmd]()
  end
end

local miscmds = require "settings.miscmds"
for option, enabled in pairs(__KRAKEN.miscmds) do
  if enabled then
    miscmds[option]()
  end
end
