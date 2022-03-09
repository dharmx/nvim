local g = vim.g
local commands = {
  a = {
    description = { "  Find File                 SPC t f" },
    command = "Telescope find_files",
  },
  b = {
    description = { "  Recents                   SPC t h" },
    command = "Telescope oldfiles",
  },
  c = {
    description = { "  Find Word                 SPC t w" },
    command = "Telescope live_grep",
  },
  d = {
    description = { "洛 New File                  SPC f n" },
    command = "DashboardNewFile",
  },
  e = {
    description = { "  Last Session              SPC s l" },
    command = "SessionLoad",
  },
  f = {
    description = { "  Media Files               SPC t i" },
    command = "Telescope media_files",
  },
  g = {
    description = { "  Todo Lists                SPC t l" },
    command = "TodoTrouble",
  },
  h = {
    description = { "  Plugins                   SPC t p" },
    command = "PackerStatus",
  },
  i = {
    description = { "  Symbols                   SPC t s" },
    command = "Telescope symbols",
  },
  j = {
    description = { "  Keymaps                   SPC t k" },
    command = "Telescope keymaps",
  },
}

g.dashboard_disable_at_vimenter = 1
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

local BANNER = "SLEEKRAKEN"
local banners = require "tables.banners"
g.dashboard_custom_header = banners[BANNER]

local function subtable(items, upto)
  local box = {}
  local keys = vim.tbl_keys(items)
  local values = vim.tbl_values(items)
  local count = 1
  while count <= upto do
    box[keys[count]] = values[count]
    count = count + 1
  end
  return box
end

g.dashboard_custom_section = subtable(commands, banners.commands[BANNER])
-- g.dashboard_custom_footer = { "─────────── Powered By  LuaJIT ───────────" }
g.dashboard_custom_footer = { "Powered By  LuaJIT" }

-- vim:ft=lua
