local present, installer = pcall(require, "nvim-lsp-installer")

if not present then
  return
end

local fn = vim.fn
local nv = require("utils.neovim")
local lsp = vim.lsp

local servers = require("tables.servers")

installer.setup({
  ui = {
    icons = {
      server_installed = "",
      server_pending = "◍",
      server_uninstalled = "ﮁ",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },
  install_root_dir = fn.stdpath("data") .. "/servers",
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 5,
})

for name, _ in pairs(servers) do
  local found, server = installer.get_server(name)
  ---@diagnostic disable-next-line: undefined-field
  if found and not server:is_installed() then
    nv.notify({
      message = "Installing " .. name,
      icon = "",
      title = "nvim-lsp-installer",
    })
    ---@diagnostic disable-next-line: undefined-field
    server:install()
  end
end

-- vim:ft=lua
