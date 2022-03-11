alias("CommitList", "Telescope git_commits")
alias("EnvList", "Telescope env")
alias("Keymaps", "Telescope keymaps")
alias("GitHL", "Gitsigns toggle_signs")
alias("FormatConfigAll", "lua vim.fn.system('stylua --config-path ' .. vim.fn.stdpath('config') .. '/.stylua.toml ' .. vim.fn.stdpath('config'))")
alias("LspLog", "edit " .. lsp.get_log_path())
alias("NvimLog", "edit " .. stdpath "cache" .. "/log")
alias("PackerLog", "edit " .. stdpath "cache" .. "/packer.nvim.log")
alias("TelescopeLog", "edit " .. stdpath "cache" .. "/telescope.log")
alias("NullLsLoad", "lua require 'configs.null'")
alias("StartPage", "Dashboard | TabLineTGL")
alias("TabLineTGL", "if &stal == 2 | set stal=0 | else | set stal=2 | endif")
alias("StatusLineTGL", "if &ls == 2 | set ls=0 | else | set ls=2 | endif")
alias("NumberColumnTGL", "set nu!")
alias("RelativeNumberColumnTGL", "set rnu!")
alias("SpellingTGL", "set spell!")

cmd "command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.create PackerSnapshot  lua require('packer').snapshot(<f-args>)"
cmd "command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.rollback PackerSnapshotRollback  lua require('packer').rollback(<f-args>)"
cmd "command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.snapshot PackerSnapshotDelete lua require('packer.snapshot').delete(<f-args>)"
cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)"
cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)"
cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)"
cmd "command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>')"
cmd "command! PackerClean lua require('packer').clean()"
cmd "command! PackerStatus lua require('packer').status()"
cmd "command! PackerProfile lua require('packer').profile_output()"
cmd "command! PackerCompile lua require('packer').compile()"

hi("YankFeed", { foreground = colors.rainbow.cobalt, decoration = "bold" })
hi("Hidden", { foreground = colors.common.base00, background = colors.common.base00 })

-- vim:ft=lua
