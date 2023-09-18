local ok, formatter = pcall(require, "formatter")
if not ok then return end

formatter.setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    ["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
    c = require("formatter.filetypes.c").clangformat,
    php = require("formatter.filetypes.php").php_cs_fixer,
    lua = require("formatter.filetypes.lua").stylua,
    json = require("formatter.filetypes.json").fixjson,
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
