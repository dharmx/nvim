local M = {}

function M.pick_colors()
  local Task = require("plenary.job")
  Task:new({
    "xcolor",
    on_exit = vim.schedule_wrap(function(self, code, _)
      if code ~= 0 then
        vim.notify("Could not run xcolor.")
        return
      end
      local result = self:result()
      vim.notify("Copied " .. result[1]:upper() .. " into +.")
      vim.fn.setreg("+", result)
    end),
  }):start()
end

function M.column()
  if vim.wo.colorcolumn == "0" then
    vim.wo.colorcolumn = vim.bo.textwidth .. ""
    return
  end
  vim.wo.colorcolumn = "0"
end

function M.auto_mkdirs()
  local directory = vim.fn.expand("<afile>:p:h")
  if directory:find("%l+://") == 1 then return end
  if vim.fn.isdirectory(directory) == 0 then vim.fn.mkdir(directory, "p") end
end

return M
