local M = {}

M["CommitList"] = "Telescope git_commits"
M["EnvList"] = "Telescope env"
M["Keymaps"] = "Telescope keymaps"
M["GitHL"] = "Gitsigns toggle_signs"
M["FormatConfigAll"] = "lua vim.fn.system('stylua --config-path ' .. vim.fn.stdpath('config') .. '/.stylua.toml ' .. vim.fn.stdpath('config'))"
M["LspLog"] = "edit " .. lsp.get_log_path()
M["NvimLog"] = "edit " .. stdpath "cache" .. "/log"
M["PackerLog"] = "edit " .. stdpath "cache" .. "/packer.nvim.log"
M["TelescopeLog"] = "edit " .. stdpath "cache" .. "/telescope.log"
M["TSStart"] = "lua require 'configs.treesitter'"
M["StartPage"] = "Dashboard | TabLineTGL"
M["TabLineTGL"] = "if &stal == 2 | setlocal stal=0 | else | setlocal stal=2 | endif"
M["StatusLineTGL"] = "if &ls == 2 | setlocal ls=0 | else | setlocal ls=2 | endif"
M["NumberColumnTGL"] = "setlocal nu!"
M["RelativeNumberColumnTGL"] = "setlocal rnu!"
M["SpellingTGL"] = "setlocal spell!"
M["SpotifyExit"] = "lua api.nvim_exec('!killall spotifyd &', false)"

local N = {
 "command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.create PackerSnapshot  lua require('packer').snapshot(<f-args>)",
 "command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.rollback PackerSnapshotRollback  lua require('packer').rollback(<f-args>)",
 "command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.snapshot PackerSnapshotDelete lua require('packer.snapshot').delete(<f-args>)",
 "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)",
 "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)",
 "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)",
 "command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>')",
 "command! PackerClean lua require('packer').clean()",
 "command! PackerStatus lua require('packer').status()",
 "command! PackerProfile lua require('packer').profile_output()",
 "command! PackerCompile lua require('packer').compile()",
}

return {
  aliases = M,
  packer = N,
}

-- vim:ft=lua
