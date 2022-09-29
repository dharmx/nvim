local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local fn = vim.fn
local nv = require("utils.neovim")
local lsp = vim.lsp
local lsp_util = require("utils.lsp")

vim.diagnostic.config({
  virtual_text = { prefix = " ", source = "always" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { source = "always" },
})

for server_name, server_config in pairs(require("tables.servers")) do
  local user_config = vim.tbl_extend("keep", {
    autostart = true,
    flags = lsp_util.flags(),
    capabilities = lsp_util.capabilities(server_name),
    on_attach = lsp_util.on_attach(),
    handlers = lsp_util.handlers(),
  }, server_config or {})

  if server_name ~= "jdtls" and server_name ~= "rust_analyzer" then
    lspconfig[server_name].setup(user_config)
  else
    local installer_servers = require("nvim-lsp-installer.servers")
    if vim.bo.filetype == "rust" then
      local ok, rust_analyzer = installer_servers.get_server("rust_analyzer")
      if ok then
        local rust_tools_installed, rustools = pcall(require, "rust-tools") -- see if rust-tools is installed
        if rust_tools_installed then -- if found then attach using rust-tools
          local rust_tools_config = { tools = { hover_actions = { border = "solid" } } }

          rust_tools_config.server = vim.tbl_deep_extend("force", rust_analyzer:get_default_options(), user_config)
          rust_tools_config.server.root_dir = require("lspconfig.util").root_pattern({
            "Cargo.toml",
            "rust-project.json",
          }) or vim.loop.cwd()

          -- INFO: most important line
          vim.env.PATH = rust_analyzer:get_default_options().cmd_env.PATH
          rust_tools_config.server.cmd = rust_analyzer:get_default_options().cmd

          rustools.setup(rust_tools_config)
        else -- otherwise go with default lspconfig
          lspconfig.rust_analyzer.setup(user_config)
        end
      end
    elseif vim.bo.filetype == "java" then
      local ok, jdtls = installer_servers.get_server("jdtls")
      if ok then
        user_config.cmd = jdtls:get_default_options().cmd
        local workspace = os.getenv("HOME") .. "/.workspaces/" .. fn.fnamemodify(fn.getcwd(), ":p:h:t")
        user_config.cmd[#user_config.cmd] = workspace
        require("jdtls").start_or_attach(user_config)
      end
    end
  end
end

nv.unalias("LoadNullLsp")
