---@diagnostic disable: missing-fields
local function new_popup()
  local Popup = require("plenary.popup")
  vim.api.nvim_set_hl(0, "RunNormal", { background = "#151A1F" })
  vim.api.nvim_set_hl(0, "RunTitle", { background = "#7AB0DF", foreground = "#151A1F" })
  local height = 10
  local width = 60
  local buffer = vim.api.nvim_create_buf(false, false)
  return {
    buffer = buffer,
    open = function()
      return Popup.create(buffer, {
        title = "Run",
        highlight = "RunNormal,FloatTitle:RunTitle",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
      })
    end,
  }
end

vim.api.nvim_create_user_command("Run", function()
  local popup = new_popup()
  local Task = require("plenary.job")
  local file = vim.fn.expand("%")
  local stem = vim.fn.fnamemodify(file, ":t:r")
  local window, _ = popup.open()

  local channel = vim.api.nvim_open_term(popup.buffer, {})
  vim.api.nvim_win_set_option(window, "number", true)
  local task = Task:new({
    "./" .. stem,
    skip_validation = true,
    on_stdout = vim.schedule_wrap(function(errors, data, _)
      if errors then return end
      if not data then return vim.api.nvim_chan_send(channel, "=====END=====\r\n") end
      pcall(vim.api.nvim_chan_send, channel, data .. "\r\n")
    end),
  })
  Task:new({
    "gcc", "-o", stem, file,
    on_exit = function(_, code)
      if code ~= 0 then return end
      task:start()
    end,
  }):start()
  vim.keymap.set("n", "<C-q>", function() task:shutdown() end, { buffer = popup.buffer })
  vim.keymap.set("n", "q", function() vim.api.nvim_win_close(window, true) end, { buffer = popup.buffer })
end, { desc = "Compile and run C file." })
