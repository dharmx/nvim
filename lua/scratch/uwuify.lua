local M = {}
M._defaults = { uwuify = "/tmp/uwuify" }
M._config = M._defaults

local Path = require("plenary.path")
local Task = require("plenary.job")

function M.uwuify(item, callback)
  local uwuify = Path:new(M._config.uwuify)
  uwuify:write(item, "w")
  Task:new({ "uwuify", uwuify.filename, on_exit = callback }):start()
end

function M.line()
  local line = vim.api.nvim_get_current_line()
  M.uwuify(
    line,
    vim.schedule_wrap(function(this, _) vim.api.nvim_set_current_line(table.concat(this:result(), " ")) end)
  )
end

function M.setup(options)
  M._config = vim.tbl_deep_extend("keep", vim.F.if_nil(options, {}), M._config)
  vim.keymap.set("n", ";w", M.line, { desc = "Uwuify current line." })
end

return M
