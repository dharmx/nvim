local M = {}

M.setup = function(client, buffer)
  alias("Format", schedule_wrap(vim.lsp.buf.formatting_sync))
  alias("FormatSeq", schedule_wrap(vim.lsp.buf.formatting_seq_sync))
end

return M

-- vim:ft=lua
