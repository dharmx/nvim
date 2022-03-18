local present, bufferline = pcall(require, "bufferline")

if not present then
  return
end

local offsets = {
  {
    filetype = "NvimTree",
    text = "",
    padding = 0,
    highlight = "NvimTreeNormal",
    text_align = "left",
  },
  {
    filetype = "Outline",
    text = "",
    padding = 0,
    highlight = "Normal",
    text_align = "left",
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
    close_icon = "",
    indicator = "|",
    icon_pinned = "ﲀ",
    show_close_icon = true,
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    show_buffer_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    diagnostics = true,
    custom_filter = function(buffer_number)
      local present_type, typeof = pcall(function()
        return api.nvim_buf_get_var(buffer_number, "term_type")
      end)

      if present_type then
        if typeof == "vert" then
          return false
        elseif typeof == "hori" then
          return false
        end
        return true
      end

      return true
    end,
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
  custom_areas = {
    right = function()
      local result = {}
      local seve = vim.diagnostic.severity
      local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
      local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
      local info = #vim.diagnostic.get(0, { severity = seve.INFO })
      local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

      if error ~= 0 then
        table.insert(result, {
          text = "  " .. error,
          guifg = colors.common.base11,
        })
      end

      if warning ~= 0 then
        table.insert(result, {
          text = "  " .. warning,
          guifg = colors.common.base12,
        })
      end

      if hint ~= 0 then
        table.insert(result, {
          text = "  " .. hint,
          guifg = colors.common.base13,
        })
      end

      if info ~= 0 then
        table.insert(result, { text = "  " .. info, guifg = colors.common.base09 })
      end
      return result
    end,
  },
}

bufferline.setup(config)

-- vim:ft=lua
