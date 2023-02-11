local ok, formatter = pcall(require, "formatter")
if not ok then return end
local util = require("formatter.util")

formatter.setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
      function()
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    ["python"] = {
      require("formatter.filetypes.python").autopep8,
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
    },
    ["c"] = require("formatter.filetypes.c").clangformat,
    ["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
  },
})

-- vim:filetype=lua
