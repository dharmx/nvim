local M = {}
local alias = require("utils").alias

M.setup = function()
  alias("Format", "lua vim.lsp.buf.formatting_sync()")
end 

return M
