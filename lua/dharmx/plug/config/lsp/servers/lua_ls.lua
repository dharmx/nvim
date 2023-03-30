local schema = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = require("lspconfig.util").root_pattern({
    "stylua.toml",
    ".stylua.toml",
    ".styluaignore",
    ".luarc.json",
    ".luarc",
    "luarc.json",
    ".luacheckrc",
    "selene.toml",
    ".selene.toml",
    ".git",
    "neoconf.json",
    ".neoconf.json",
  }) or vim.loop.cwd(),
  single_file_support = true,
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
    },
  },
}

return schema
