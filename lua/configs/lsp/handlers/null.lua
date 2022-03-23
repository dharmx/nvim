local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local fmtng = null_ls.builtins.formatting
local cacts = null_ls.builtins.code_actions
local cmplt = null_ls.builtins.completion
local diags = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover

local sources = {
  fmtng.prettier,
  fmtng.autopep8,
  fmtng.black,
  fmtng.clang_format,
  fmtng.cmake_format,
  fmtng.codespell,
  fmtng.eslint,
  fmtng.fish_indent,
  fmtng.fixjson,
  fmtng.google_java_format.with { extra_args = { "--aosp" } },
  fmtng.isort,
  fmtng.json_tool,
  fmtng.stylua.with {
    condition = function(utils)
      return utils.root_has_file { "stylua.toml", ".stylua.toml" }
    end,
  },
  fmtng.lua_format,
  fmtng.latexindent,
  fmtng.markdownlint,
  fmtng.nginx_beautifier,
  fmtng.nixfmt,
  fmtng.qmlformat,
  fmtng.rustfmt,
  fmtng.rustywind,
  fmtng.shellharden,
  fmtng.shfmt,
  fmtng.sqlformat,
  fmtng.stylelint,
  fmtng.taplo,
  fmtng.trim_whitespace,
  fmtng.uncrustify,
  fmtng.astyle,

  cacts.gitsigns,
  cacts.shellcheck,
  cacts.statix,
  cacts.proselint,

  hover.dictionary,
  cmplt.luasnip,
  diags.standardjs,
  diags.chktex,
  diags.stylelint,
  diags.qmllint,
  diags.shellcheck,
  diags.vint,
  diags.write_good,
  diags.yamllint,
  diags.pylint.with { method = null_ls.methods.DIAGNOSTICS_ON_SAVE },
}

local helpers = require "null-ls.helpers"

local markdownlint = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "markdown" },
  generator = null_ls.generator {
    command = "markdownlint",
    args = { "--stdin" },
    to_stdin = true,
    from_stderr = true,
    format = "line",
    check_exit_code = function(code, stderr)
      local success = code <= 1

      if not success then
        print(stderr)
      end

      return success
    end,
    on_output = helpers.diagnostics.from_patterns {
      {
        pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
        groups = { "row", "col", "message" },
      },
      { pattern = [[:(%d+) [%w-/]+ (.*)]], groups = { "row", "message" } },
    },
  },
}

null_ls.register(markdownlint)

local config = { sources = sources }

null_ls.setup(config)

g._autosave = false
alias("ToggleAutoFormat", schedule_wrap(require("utils.lsp").autosave))

-- vim:ft=lua
