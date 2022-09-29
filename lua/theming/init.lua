local I = {}

local nv = require("utils.neovim")
local util = require("utils.theming")
local fn = vim.fn

--- This is the trigger function for setting up highlights.
-- @param options which will contain the colorscheme and other.
function I.setup(options)
  _G.theme = options.theme
  if fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- adapted from https://is.gd/fpStrw
  local hl_raw = vim.split(vim.api.nvim_exec("filter BufferLine hi", true), "\n")
  local hl_groups = {}
  for _, raw_hl in ipairs(hl_raw) do
    table.insert(hl_groups, string.match(raw_hl, "BufferLine%a+"))
  end
  for _, hl in ipairs(hl_groups) do
    vim.cmd([[hi clear ]] .. hl)
  end

  nv.reload_module("theming.highlights")

  local req_formats = vim.tbl_map(function(path)
    local split = vim.split(vim.fn.fnamemodify(path, ":r"), "/")
    return "theming.highlights." .. split[#split - 1] .. "." .. split[#split]
  end, nv.scan_dir("/lua/theming/highlights"))

  for _, req_format in ipairs(req_formats) do
    local hl_chunk = require(req_format)
    for group, colors in pairs(hl_chunk) do
      util.highlight(group, colors)
    end
  end
  require("theming.terminal")
end

return I

-- vim:ft=lua
