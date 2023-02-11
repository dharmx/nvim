local ok, neoconf = pcall(require, "neoconf")
if not ok then return end

neoconf.setup({
  local_settings = ".neoconf.json",
  global_settings = "neoconf.json",
  import = {
    vscode = true,
    coc = true,
    nlsp = true,
  },
  live_reload = true,
  filetype_jsonc = true,
  plugins = {
    lspconfig = {
      enabled = true,
    },
  },
})

-- vim:filetype=lua
