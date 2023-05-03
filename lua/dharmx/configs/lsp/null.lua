local ok, null = pcall(require, "null-ls")
if not ok then return end
local helpers = require("null-ls.helpers")

null.register({
  method = null.methods.DIAGNOSTICS,
  filetypes = { "markdown" },
  generator = null.generator({
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
      { pattern = [[:(%d+) [%w-/]+ (.*)]], groups = { "row", "message" } },
    }),
  }),
})

null.setup({
  sources = {
    null.builtins.formatting.stylua.with({
      condition = function(utils) return utils.root_has_file({ "stylua.toml", ".stylua.toml" }) end,
    }),
    null.builtins.formatting.google_java_format.with({ extra_args = { "--aosp" } }),
    null.builtins.formatting.shfmt.with({
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
    null.builtins.formatting.autopep8,
    null.builtins.formatting.eslint_d,
    null.builtins.formatting.fixjson,
    null.builtins.formatting.isort,
    null.builtins.formatting.json_tool,
    null.builtins.formatting.latexindent,
    null.builtins.formatting.markdownlint,
    null.builtins.formatting.rustfmt,
    null.builtins.formatting.rustywind,
    null.builtins.formatting.sqlfluff,
    null.builtins.formatting.stylelint,
    null.builtins.formatting.trim_whitespace,
    null.builtins.code_actions.shellcheck,
    null.builtins.diagnostics.chktex,
    null.builtins.diagnostics.stylelint,
    null.builtins.diagnostics.shellcheck,
    null.builtins.diagnostics.vint,
    null.builtins.formatting.fish_indent,
    null.builtins.formatting.prettier,
    null.builtins.formatting.black,
    null.builtins.formatting.cmake_format,
    null.builtins.formatting.nginx_beautifier,
    null.builtins.formatting.shellharden,
    null.builtins.formatting.uncrustify,
    null.builtins.formatting.astyle,
    null.builtins.code_actions.statix,
    -- null.builtins.formatting.codespell,
    -- null.builtins.diagnostics.write_good,
    -- null.builtins.formatting.prettierd,
    -- null.builtins.code_actions.proselint,
    -- null.builtins.code_actions.gitsigns,
  },
})
