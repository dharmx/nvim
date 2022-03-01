local M = {}
local cmd = vim.api.nvim_command

M["ease_quit"] = function()
  cmd "cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))"
  cmd "cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))"
  cmd "cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))"
  cmd "cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))"
end

M["force_quit"] = function()
  cmd "cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q!'):('q'))"
  cmd "cnoreabbrev <expr> q ((getcmdtype() is# ':' && getcmdline() is# 'q')?('q!'):('q'))"
end

return M
