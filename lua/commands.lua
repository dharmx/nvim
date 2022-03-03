local alias = require("utils").alias
local hi = require("theming.utils.helpers").highlight
local colors = require("theming.utils.helpers").get_active_scheme()
local cmd = vim.api.nvim_command

alias("CommitList", "Telescope git_commits")
alias("EnvList", "Telescope env")
alias("Projects", "Telescope project")
alias("CommandPalette", "Telescope command_palette")
alias("Keymaps", "Telescope keymaps")
alias("ToggleStatusLine", "lua require('utils').toggle_status()")
alias("ToggleNumber", "lua require('utils').toggle_number()")
alias("GitHL", "Gitsigns toggle_signs")
alias("FormatConfigAll", "lua vim.fn.system('stylua --config-path ' .. vim.fn.stdpath('config') .. '/.stylua.toml ' .. vim.fn.stdpath('config'))")
alias("TabLineON", "lua vim.opt.tabline = '%!v:lua.nvim_bufferline()'")
alias("TabLineOFF", "lua vim.opt.tabline = '%#Hidden#-'")

hi("YankFeed", { foreground = colors.rainbow.cobalt, decoration = "bold" })
hi("Hidden", { foreground = colors.common.base00, background = colors.common.base00 })

cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)"
cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)"
cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)"
cmd "command! PackerClean lua require('packer').clean()"
cmd "command! PackerStatus lua require('packer').status()"
cmd "command! PackerProfile lua require('packer').profile_output()"
cmd "command! PackerCompile lua require('packer').compile('~/.config/nvim/lua/packer_compiled.lua')"
cmd "command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>')"
