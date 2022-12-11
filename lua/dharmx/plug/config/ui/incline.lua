if vim.g.loaded_statusline == 1 then return end

local present, incline = pcall(require, "incline")

if not present then return end

local api = vim.api
local ok, devicons = pcall(require, "nvim-web-devicons")

if not ok then
  incline.setup()
  return
end

local col = require("colo.api").theme.current()
local colors = {
  theme_bg = col.yellow,
  fg = col.white,
  fg_nc = col.magenta,
  bg = col.bright_black,
  bg_nc = col.black:lighten(2),
  cursorline = col.bright_black:darken(1),
  cursorline_nc = col.black:brighten(1):lighten(1),
}

for name, color in pairs(colors) do
  colors[name] = color:hex(true)
end

incline.setup({
  render = function(props)
    local bufname = api.nvim_buf_get_name(props.buf)
    local cursor = api.nvim_win_get_cursor(props.win)

    local modified = api.nvim_buf_get_option(props.buf, "modified")
    local focused = api.nvim_get_current_win() == props.win

    local fg = focused and colors.fg or colors.fg_nc
    local bg = focused and colors.bg or colors.bg_nc

    -- Match cursorline background if cursor is on the same line as the statusline
    local fname = bufname == "" and "[No Name]" or vim.fn.fnamemodify(bufname, ":t")

    local icon, icon_fg
    if bufname ~= "" then
      icon, icon_fg = devicons.get_icon_color(fname)
    end
    if not icon or icon == "" then
      local icon_name
      local filetype = api.nvim_buf_get_option(props.buf, "filetype")
      if filetype ~= "" then icon_name = devicons.get_icon_name_by_filetype(filetype) end
      if icon_name and icon_name ~= "" then
        icon, icon_fg = require("nvim-web-devicons").get_icon_color(icon_name)
      end
    end
    icon = icon or ""
    icon_fg = props.focused and (icon_fg or colors.fg) or colors.fg_nc

    return {
      guibg = bg,
      guifg = fg,
      " ",
      { icon, guifg = icon_fg },
      " ",
      { fname, gui = modified and "bold" or nil },
      { modified and "+ " or " ", guifg = colors.fg_nc },
    }
  end,
  window = {
    margin = { horizontal = 0, vertical = 0 },
    padding = 0,
    zindex = 51,
    placement = { horizontal = "right", vertical = "top" },
  },
  hide = {
    cursorline = "focused_win",
    focused_win = false,
  },
})

-- vim:filetype=lua
