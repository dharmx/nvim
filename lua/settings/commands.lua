local alias = require("utils.misc").alias
local hi = require("theming.utils.helpers").highlight
local colors = require("theming.schemes." .. __KRAKEN.theme.colorscheme)

alias("CommitList", "Telescope git_commits")
alias("EnvList", "Telescope env")
alias("Projects", "Telescope project")
alias("CommandPalette", "Telescope command_palette")
alias("Keymaps", "Telescope keymaps")
alias("ManagePlugins", "lua require('utils.misc').manage_plugins()")
alias("ToggleStatusLine", "lua require('utils.misc').toggle_status()")
alias("ToggleNumber", "lua require('utils.misc').toggle_number()")
alias("GitHL", "Gitsigns toggle_signs")
alias(
  "FormatConfigAll",
  "lua vim.fn.system('stylua --config-path ' .. vim.fn.stdpath('config') .. '/.stylua.toml ' .. vim.fn.stdpath('config'))"
)

hi("YankFeed", { foreground = colors.rainbow.cobalt, decoration = "bold" })
