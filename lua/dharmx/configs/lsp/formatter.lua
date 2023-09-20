local ok, formatter = pcall(require, "formatter")
if not ok then return end

local util = require("formatter.util")

formatter.setup({
  filetype = {
    ["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
    blade = function()
      return {
        exe = "blade-formatter",
        args = { "--write" },
        stdin = false,
        ignore_exitcode = true,
      }
    end,
    c = require("formatter.filetypes.c").clangformat,
    php = require("formatter.filetypes.php").php_cs_fixer,
    lua = require("formatter.filetypes.lua").stylua,
    json = function()
      return {
        exe = "jq",
        args = { "--indent", vim.o.shiftwidth },
        stdin = true,
      }
    end,
    cmake = require("formatter.filetypes.cmake").cmakeformat,
    python = {
      require("formatter.filetypes.python").isort,
      function()
        local defaults = require("formatter.filetypes.python").black()
        table.insert(defaults.args, 1, { "-l", vim.bo.textwidth })
        defaults.args = vim.tbl_flatten(defaults.args)
        return defaults
      end,
    },
  },
})
