local present, installer = pcall(require, "nvim-lsp-installer")

if not present then
  return
end

local servers = {
  ["bashls"] = {},
  ["jdtls"] = require "configs.lsp.servers.jdtls",
  ["jsonls"] = require "configs.lsp.servers.jsonls",
  ["yamlls"] = {},
  ["pyright"] = {},
  ["sumneko_lua"] = require "configs.lsp.servers.sumneko_lua",
  ["cssls"] = {},
  ["stylelint_lsp"] = {},
  ["tailwindcss"] = {},
}

local function on_attach(client, buffer)
  require("mappings.lsp").setup(client, buffer)
  require("configs.lsp.autocmds").setup(client, buffer)
  require("configs.lsp.commands").setup(client, buffer)
  require("configs.lsp.icons").setup()

  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  notify {
    message = "LSP has been initialised.",
    title = "LSP: " .. client.name,
    icon = " ",
  }
end

local function configure_installer()
  installer.settings {
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
        update_all_servers = "U",
        uninstall_server = "X",
      },
    },
    install_root_dir = stdpath "data" .. "/servers",
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 5,
  }
end

local function ensure_servers()
  for name, _ in pairs(servers) do
    local found, server = installer.get_server(name)
    if found and not server:is_installed() then
      notify {
        message = "Installing " .. name,
        icon = "",
        title = "nvim-lsp-installer",
      }
      server:install()
    end
  end
end

local function configure_servers()
  installer.on_server_ready(function(server)
    local capabilities = require "configs.lsp.capabilities"
    local flags = { debounce_text_changes = 150 }
    local handlers = require "configs.lsp.handlers"

    local server_config = {
      flags = flags,
      capabilities = capabilities,
      on_attach = on_attach,
      handlers = handlers,
    }

    if server.name ~= "jdtls" then
      server:setup(vim.tbl_extend("keep", server_config, servers[server.name]))
    else
      if bo.filetype == "java" then
        local _, jdtls = require("nvim-lsp-installer.servers").get_server "jdtls"
        server_config.cmd = jdtls:get_default_options().cmd
        local workspace = os.getenv "HOME" .. "/.workspaces/" .. fn.fnamemodify(fn.getcwd(), ":p:h:t")
        server_config.cmd[#server_config.cmd] = workspace
        require("jdtls").start_or_attach(vim.tbl_extend("keep", server_config, servers[server.name]))
      end
    end
    _ = require "configs.lsp.handlers.null"
  end)
end

local function configure_diagnostics()
  diagnostic.config {
    virtual_text = { prefix = " ", source = "always" },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { source = "always" },
  }
end

require "configs.lsp.schema"
configure_diagnostics()
configure_installer()
ensure_servers()
configure_servers()

-- vim:ft=lua
