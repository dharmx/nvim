-- depends on https://github.com/MunifTanjim/nui.nvim
local Menu = require("nui.menu")
local NuiText = require("nui.text")

-- behaviour of the global elements of the window
-- like heading position size borders
local popup_options = {
  size = { width = 20, height = 4 },
  position = {
    row = "50%",
    col = "50%",
  },
  border = {
    style = {
      top_left = NuiText(" ", "NUINormal"),
      top = NuiText(" ", "NUINormal"),
      top_right = NuiText(" ", "NUINormal"),
      left = NuiText(" ", "NUINormal"),
      right = NuiText(" ", "NUINormal"),
      bottom_left = NuiText(" ", "NUINormal"),
      bottom = NuiText(" ", "NUINormal"),
      bottom_right = NuiText(" ", "NUINormal"),
    },
    text = {
      top = NuiText("", "NUIHeading"),
      top_align = "center",
    },
  },
  win_options = {
    winblend = 0,
    winhighlight = "NUIText:NUIText",
  },
}

local menu_options = {
  lines = {
    Menu.separator(NuiText(" Save? ", "NUIHeading"), { char = "─", text_align = "center" }),
    Menu.item(NuiText("   Yes      ", "NUIYes")),
    Menu.item(NuiText("   No       ", "NUINo")),
    Menu.item(NuiText("   Cancel   ", "NUICancel")),
  },
  keymap = {
    focus_next = { "j", "<Down>", "<Tab>" },
    focus_prev = { "k", "<Up>", "<S-Tab>" },
    close = { "<Esc>", "<C-c>" },
    submit = { "<CR>", "<Space>" },
  },
}

local function force_quit(item)
  local result = vim.trim(item.text._content)
  if result == "Yes" then
    vim.cmd("wqall!")
  elseif result == "No" then
    vim.cmd("quitall!")
  elseif result == "Cancel" then
    vim.api.nvim_notify("Cancelled.", vim.log.levels.INFO, {
      title = "bufclose.lua",
      icon = " ",
    })
  else
    error("Invalid option!", vim.log.levels.ERROR)
  end
end

local function normal_quit(item)
  local result = vim.trim(item.text._content)
  if result == "Yes" then
    vim.cmd.write()
    vim.cmd.bdelete()
  elseif result == "No" then
    vim.cmd.bdelete()
  elseif result == "Cancel" then
    vim.api.nvim_notify("Cancelled.", vim.log.levels.INFO, {
      title = "bufclose.lua",
      icon = " ",
    })
  else
    error("Invalid option!", vim.log.levels.ERROR)
  end
end

-- where the magic happens
return function()
  local cur_winnr = vim.fn.winnr()
  local cur_bufnr = vim.fn.bufnr()
  local buflisted = vim.fn.getbufinfo({ buflisted = 1 })

  if #buflisted < 2 then
    if not vim.bo.modified then
      vim.cmd("quitall!")
      return
    end
    menu_options.on_submit = force_quit
    Menu(popup_options, menu_options):mount()
    return
  end

  for _, winid in ipairs(vim.fn.getbufinfo(cur_bufnr)[1].windows) do
    if vim.bo.modified then
      menu_options.on_submit = normal_quit
      Menu(popup_options, menu_options):mount()
    else
      vim.cmd(("%d wincmd w"):format(vim.fn.win_id2win(winid)))
      vim.cmd(cur_bufnr == buflisted[#buflisted].bufnr and "bp" or "bn")
      vim.cmd(("%d wincmd w"):format(cur_winnr))
      local is_terminal = vim.fn.getbufvar(cur_bufnr, "&buftype") == "terminal"
      vim.cmd(is_terminal and "bd! #" or "silent! confirm bd #")
    end
  end
end

-- vim:filetype=lua
