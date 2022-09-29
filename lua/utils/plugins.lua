--- Utility functions that are used by plugin configurations.

local M = {}

local api = vim.api
local notify = require("utils.neovim").notify
local fn = vim.fn

--- A tiny function for nvim-cmp to better sort completion items
--- that start with one or more underlines. In most languages, especially
--- Python, items that start with one or more underlines should be at the
--- end of the completion suggestion.
-- @param entry1 the completion item that needs to be compared to
-- @param entry2 the completion item that the entry1 will be compared with.
-- @return boolean true if entry1 is greater than entry2, false otherwise.
-- @see Adapted from https://is.gd/FbwlTM
function M.cmp_under(entry1, entry2)
  local _, entry1_under = entry1.completion_item.label:find("^_+")
  local _, entry2_under = entry2.completion_item.label:find("^_+")
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

-- Builds pandoc document.
function M.pandoc_build()
  local pandoc = require("pandoc")
  -- Make your pandoc command
  local input = api.nvim_get_buf_name(0)
  pandoc.render.build({
    input = input,
    args = {
      { "--standalone" },
      { "--toc" },
      {
        "--filter",
        "pandoc-crossref",
      },
      {
        "--pdf-engine",
        "xelatex",
      },
    },
    output = "pandoc.pdf",
  })
end

--- Copies an image from given path.
-- If said image is in JPG format then copy it right away.
-- And, if the image is in PNG format then convert it to JPG
-- and then copy its contents.
-- @see help vim.fn.system
function M.copy_image(filepath)
  local basename = vim.split(filepath, "/")
  if string.find(filepath, ".png$") then
    local command = "xclip -selection clipboard -target image/png '" .. filepath .. "'"
    fn.system("bash -c '" .. command .. "'")
  else
    local command = "convert '" .. filepath .. "' png:- | xclip -selection clipboard -t image/png"
    fn.system("bash -c '" .. command .. "'")
  end
  notify({
    message = "Copied " .. basename[#basename] .. " to the  clipboard.",
    icon = "",
    title = "telescope-media-files.nvim",
  })
end

return M

-- vim:ft=lua
