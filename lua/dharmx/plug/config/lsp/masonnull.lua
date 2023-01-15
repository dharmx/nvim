local ok, mason_null = pcall(require, "mason-null-ls")
if not ok then return end

mason_null.setup({
  ensure_installed = {
    "stylua",
    "autopep8",
    "eslint_d",
    "fixjson",
    "isort",
    "markdownlint",
    "sqlfluff",
    "stylelint",
    "editorconfig_checker",
    "shellcheck",
    "vint",
    "write_good",
    "prettier",
    "black",
    "shellharden",
    "codespell",
    "proselint",
    "gitlint",
    "prettierd",
    "shfmt",
  },
  automatic_installation = true,
  automatic_setup = true,
})

mason_null.setup_handlers()

-- vim:filetype=lua
