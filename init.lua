require "globals" -- variables available throughout the config
require "options" -- vim.opt, vim.g, vim.env, vim.o, vim.bo, vim.wo config
require "commands" -- user commands, aliases and highlights definitions
require "autocmds" -- auto-command presets, opt-like config
require "abbrevs" -- custom command abbreviations

-- NOTE: First line of defence. If the paths exist then it is assumed that
if fn.empty(fn.glob(install_path)) > 0 or fn.empty(fn.glob(compile_path)) > 0 then
  require "plugins"
end

pcall(function()
  require "configs.impatient"
end)

-- vim:ft=lua
