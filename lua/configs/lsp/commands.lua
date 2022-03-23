local M = {}

M.setup = function(client, buffer)
  alias("Format", schedule_wrap(lsb.formatting_sync))
  alias("FormatSeq", schedule_wrap(lsb.formatting_seq_sync))
end

return M

-- vim:ft=lua
