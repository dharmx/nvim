local M = {}

function M.alias(from, to)
  vim.api.nvim_command("command! " .. from .. " " .. to)
end

function M.manage_plugins()
  local cmd = vim.api.nvim_command
  cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)"
  cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)"
  cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)"
  cmd "command! PackerClean lua require('packer').clean()"
  cmd "command! PackerStatus lua require('packer').status()"
  cmd "command! PackerProfile lua require('packer').profile_output()"
  cmd "command! PackerCompile lua require('packer').compile('~/.config/nvim/lua/packer_compiled.lua')"
  cmd "command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>')"
  vim.api.nvim_notify(
    [[ Plugin management commands are now available!
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - PackerInstall
  - PackerUpdate
  - PackerSync
  - PackerClean
  - PackerStatus
  - PackerProfile
  - PackerLoad
  - PackerCompile]],
    vim.log.levels.INFO,
    { title = "packer.nvim", icon = " " }
  )
end

return M
