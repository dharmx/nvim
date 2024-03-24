local ok, none = pcall(require, "null-ls")
if not ok then return end

-- {{{
local helpers = require("null-ls.helpers")

none.register({
  method = none.methods.DIAGNOSTICS,
  filetypes = { "markdown" },
  generator = none.generator({
    command = "markdownlint",
    args = { "--stdin" },
    to_stdin = true,
    from_stderr = true,
    format = "line",
    check_exit_code = function(code, stderr)
      local success = code <= 1
      if not success then vim.notify(stderr) end
      return success
    end,
    on_output = helpers.diagnostics.from_patterns({
      {
        pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
        groups = { "row", "col", "message" },
      },
      {
        pattern = [[:(%d+) [%w-/]+ (.*)]],
        groups = { "row", "message" }
      },
    }),
  }),
})
-- }}}

local B = none.builtins
none.setup({
  on_attach = require("plugins.lsp.attach"),
  sources = {
    B.code_actions.proselint,
    B.diagnostics.markdownlint,
    B.diagnostics.proselint,
    B.diagnostics.stylelint,
    B.diagnostics.vint,
    B.diagnostics.zsh,
    B.formatting.cmake_format,
    B.formatting.gofmt,
    B.formatting.markdownlint,
    B.formatting.nginx_beautifier,
    B.formatting.prettier,
    B.formatting.shellharden,
    B.formatting.sql_formatter,
    B.formatting.stylelint,
    B.formatting.stylua,
    B.formatting.isort,
    B.formatting.google_java_format.with({ extra_args = { "--aosp" } }),
    B.formatting.shfmt.with({
      extra_args = function(params)
        return {
          "--indent",
          vim.api.nvim_buf_get_option(params.bufnr, "shiftwidth"),
          "--binary-next-line",
          "--case-indent",
          "--space-redirects",
          "--keep-padding",
        }
      end,
    }),
  },
})
