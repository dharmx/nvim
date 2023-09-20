local ok, mason_null = pcall(require, "mason-null-ls")
if not ok then return end

mason_null.setup({
  ensure_installed = {
    "autopep8",
    "isort",
    "stylua",
    "markdownlint",
    "sqlfluff",
    "stylelint",
    "shellcheck",
    "vint",
    "prettier",
    "black",
    "shellharden",
    "gitlint",
    "shfmt",
    "php-cs-fixer",
  },
  automatic_installation = true,
  automatic_setup = true,
})
