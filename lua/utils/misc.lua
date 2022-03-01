local M = {}
local cmd = vim.api.nvim_command

function M.alias(from, to)
  cmd("command! " .. from .. " " .. to)
end

function M.manage_plugins()
  cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)"
  cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)"
  cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)"
  cmd "command! PackerClean lua require('packer').clean()"
  cmd "command! PackerStatus lua require('packer').status()"
  cmd "command! PackerProfile lua require('packer').profile_output()"
  cmd "command! PackerCompile lua require('packer').compile()"
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

function M.toggle_status()
  local opt = vim.opt
  local hidden = opt.laststatus._value == 2 and true or false
  if hidden then
    opt.laststatus = 0
    return
  end
  opt.laststatus = 2
end

function M.toggle_number()
  local opt = vim.opt
  if opt.number._value then
    opt.number = false
    return
  end
  opt.number = true
end

return M
