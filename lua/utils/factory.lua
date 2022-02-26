local M = {}

M.notify = {}

M.notify.info = function(title, message, icon)
  vim.api.nvim_notify(message, vim.log.levels.INFO, { title = title, icon = icon })
end

return M
