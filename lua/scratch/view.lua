local M = {}

M.config = {
  fifo = os.tmpname,
  width = 70,
  height = 50,
}

function M.setup(options)
  options = vim.F.if_nil(options, {})
  M.config = vim.tbl_deep_extend("keep", options, M.config)
end

function M.view()
  if not M._ueberzug then
    local Ueberzug = require("telescope._extensions.media.lib.ueberzug")
    M._ueberzug = Ueberzug:new(M.config.fifo(), true)
    M._ueberzug:listen()
  end

  local cWORD = vim.fn.expand("<cWORD>"):gsub('"', "")
  if M._current == cWORD then
    M._ueberzug:hide()
    M._current = nil
  else
    if not vim.loop.fs_realpath(cWORD) then return end -- TODO: check if file is an image
    local cursor = vim.api.nvim_win_get_cursor(0)
    M._ueberzug:send({
      path = cWORD,
      x = cursor[2],
      y = cursor[1] + 1,
      width = M.config.width,
      height = M.config.height,
    })
    M._current = cWORD
  end
end

function M.stop()
  if not M._ueberzug then return end
  M._ueberzug:kill()
  M._ueberzug:clean()
  M._ueberzug = nil
  M._current = nil
end

return M
