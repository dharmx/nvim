local M = {}

local api = vim.api
local fn = vim.fn
local lsp = vim.lsp
local nv = require("utils.neovim")

function M.format(err, result, ctx, _)
  nv.notify(type(ctx))
  if err ~= nil or result == nil then
    return
  end

  local bufnr = ctx.bufnr
  -- If the buffer hasn't been modified before the formatting has finished,
  -- update the buffer
  if not api.nvim_buf_get_option(bufnr, "modified") then
    local view = fn.winsaveview()
    lsp.util.apply_text_edits(result, bufnr, vim.bo.fileencoding)
    fn.winrestview(view)
    if bufnr == api.nvim_get_current_buf() then
      vim.cmd("noautocmd :update")
      -- Trigger post-formatting autocommand which can be used to refresh gitsigns
      vim.cmd("silent doautocmd <nomodeline> User FormatterPost")
    end
  end
end

return M

-- vim:ft=lua
