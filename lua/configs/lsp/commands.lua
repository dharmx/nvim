local M = {}

M.setup = function()
  alias("Format", "lua vim.lsp.buf.formatting_sync()")
end

return M

-- vim:ft=lua
