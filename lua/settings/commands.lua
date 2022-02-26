local alias = require("utils.misc").alias
local hi = require("theming.utils.helpers").highlight
local colors = require("theming.utils.helpers").get_active_scheme()

alias("CommitList", "Telescope git_commits")
alias("EnvList", "Telescope env")
alias("Projects", "Telescope project")
alias("CommandPalette", "Telescope command_palette")
alias("Keymaps", "Telescope keymaps")
alias("ManagePlugins", "lua require('utils.misc').manage_plugins()")
alias("ToggleStatusLine", "lua require('utils.misc').toggle_status()")
alias("ToggleNumber", "lua require('utils.misc').toggle_number()")
alias("GitHL", "Gitsigns toggle_signs")
alias("FormatConfigAll", "lua vim.fn.system('stylua --config-path ' .. vim.fn.stdpath('config') .. '/.stylua.toml ' .. vim.fn.stdpath('config'))")
alias("TabLineON", "lua vim.opt.tabline = '%!v:lua.nvim_bufferline()'")
alias("TabLineOFF", "lua vim.opt.tabline = '%#Hidden#-'")

hi("YankFeed", { foreground = colors.rainbow.cobalt, decoration = "bold" })
hi("Hidden", { foreground = colors.common.base00, background = colors.common.base00 })

