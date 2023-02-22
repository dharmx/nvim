local schema = {
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--completion-style=detailed",
  },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  log_level = 2,
  root_dir = require("lspconfig.util").root_pattern({
    "compile_flags.txt",
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "configure.ac",
    ".git",
  }) or vim.loop.cwd(),
  single_file_support = true,
}

return schema
