local present, bufferline = pcall(require, "bufferline")

if not present then
  return
end

local offsets = {
  {
    filetype = "NvimTree",
    text = "",
    padding = 0,
  },
  {
    filetype = "Outline",
    text = "",
    padding = 0,
  },
  {
    filetype = "undotree",
    text = "",
    padding = 0,
  },
  {
    filetype = "neo-tree",
    text = "",
    padding = 0,
    highlight = "NeoTreeNormal",
  },
}

local config = {
  options = {
    themable = true,
    middle_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    right_mouse_command = "vs",
    offsets = offsets,
    numbers = "none",
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "ﳉ",
    indicator = "|",
    icon_pinned = "ﲀ",
    show_close_icon = true,
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 15,
    max_prefix_length = 12,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    show_buffer_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    diagnostics = true,
  },
  groups = {
    options = { toggle_hidden_on_enter = true },
    items = {
      {
        name = "Tests",
        highlight = { gui = "underline", guisp = "blue" },
        priority = 2,
        icon = "",
        matcher = function(buf)
          return buf.filename:match "%_test" or buf.filename:match "%_spec"
        end,
      },
      {
        name = "Docs",
        highlight = { gui = "undercurl", guisp = "green" },
        auto_close = false,
        matcher = function(buf)
          return buf.filename:match "%.md" or buf.filename:match "%.txt"
        end,
        separator = { style = require("bufferline.groups").separator.tab },
      },
    },
  },
}

bufferline.setup(config)

-- vim:ft=lua
