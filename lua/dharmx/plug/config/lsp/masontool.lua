local ok, tool = pcall(require, "mason-tool-installer")
if not ok then return end

tool.setup({
  ensure_installed = {
    { "bash-language-server", auto_update = true },
    "lua-language-server",
    "vim-language-server",
    "stylua",
    "shellcheck",
    "editorconfig-checker",
    "shellcheck",
    "shfmt",
    "vint",
  },
  auto_update = true,
  run_on_start = true,
  start_delay = 3000,
})

-- vim:filetype=lua
