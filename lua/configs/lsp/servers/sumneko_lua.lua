local schema = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = require("lspconfig.util").root_pattern {
    ".git",
    "stylua.toml",
    ".stylua.toml",
  } or vim.loop.cwd,
  single_file_support = true,
}

return schema

-- vim:ft=lua
