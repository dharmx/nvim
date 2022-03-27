--- Utility functions that are used by plugin configurations.
-- @module utils.plugins
-- @alias M

local M = {}

--- A tiny function for nvim-cmp to better sort completion items
--- that start with one or more underlines. In most languages, especially
--- Python, items that start with one or more underlines should be at the
--- end of the completion suggestion.
-- @param entry1 the completion item that needs to be compared to
-- @param entry2 the completion item that the entry1 will be compared with.
-- @return boolean true if entry1 is greater than entry2, false otherwise.
-- @see Adapted from https://is.gd/FbwlTM
function M.cmp_under(entry1, entry2)
  local _, entry1_under = entry1.completion_item.label:find "^_+"
  local _, entry2_under = entry2.completion_item.label:find "^_+"
  entry1_under = entry1_under or 0
  entry2_under = entry2_under or 0
  if entry1_under > entry2_under then
    return false
  elseif entry1_under < entry2_under then
    return true
  end
end

--- Generates a button for alpha.nvim dashboard configuration.
-- @param label the text that will be displayed at this button
-- @param shortcut the shortcut key label text
-- @param hl_icon the highlight group of the label icon
-- @param hl_label the highlight group for the button label text
-- @return table options table that will be passed onto the alpha setup function
function M.btn_gen(label, shortcut, hl_label, hl_icon)
  return {
    type = "button",
    on_press = function()
      local key = api.nvim_replace_termcodes(shortcut:gsub("%s", ""):gsub("LDR", "<leader>"), true, false, true)
      api.nvim_feedkeys(key, "normal", false)
    end,
    val = label,
    opts = {
      position = "center",
      shortcut = shortcut,
      cursor = 5,
      width = 25,
      align_shortcut = "right",
      hl_shortcut = "AlphaKeyPrefix",
      hl = {
        { hl_icon, 1, 3 }, -- highlight the icon glyph
        { hl_label, 4, 15 }, -- highlight the part after the icon glyph
      },
    },
  }
end

return M

-- vim:ft=lua
