local ok, mason_null = pcall(require, "mason-null-ls")
if not ok then return end

mason_null.setup({
  ensure_installed = {
    "autopep8",
    "eslint_d",
    "fixjson",
    "isort",
    "markdownlint",
    "sqlfluff",
    "stylelint",
    "shellcheck",
    "vint",
    "prettier",
    "black",
    "shellharden",
    "codespell",
    -- "proselint",
    "gitlint",
    "prettierd",
    "shfmt",
  },
  automatic_installation = true,
  automatic_setup = true,
})

mason_null.setup_handlers()
