local alias = require("utils.misc").alias
local cmd = vim.api.nvim_command

alias("CommitList", "Telescope git_commits")
alias("EnvList", "Telescope env")
alias("Projects", "Telescope project")
alias("CommandPalette", "Telescope command_palette")
alias("Keymaps", "Telescope keymaps")
alias("ManagePlugins", "lua require('utils.misc').manage_plugins()")

alias("GitHL", "Gitsigns toggle_signs")
alias(
  "FormatConfigAll",
  "lua vim.fn.system('stylua --config-path ' .. vim.fn.stdpath('config') .. '/.stylua.toml ' .. vim.fn.stdpath('config'))"
)
