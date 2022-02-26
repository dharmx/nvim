local g = vim.g
local banners = require "settings.banners"
local commands = {
  a = {
    description = { "  Find File                 SPC f f" },
    command = "Telescope find_files",
  },
  b = {
    description = { "  Recents                   SPC f h" },
    command = "Telescope oldfiles",
  },
  c = {
    description = { "  Find Word                 SPC f w" },
    command = "Telescope live_grep",
  },
  d = {
    description = { "洛 New File                  SPC f n" },
    command = "DashboardNewFile",
  },
  e = {
    description = { "  Last Session              SPC l s" },
    command = "SessionLoad",
  },
  f = {
    description = { "  Media Files               SPC f i" },
    command = "Telescope media_files",
  },
  g = {
    description = { "  Todo Lists                SPC t l" },
    command = "TodoTrouble",
  },
}

g.dashboard_disable_at_vimenter = 1
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = banners[__KRAKEN.banner]

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

g.dashboard_custom_section = subtable(commands, require("settings.banners").commands[__KRAKEN.banner])

g.dashboard_custom_footer = {
  "─────────── Powered By  LuaJIT ───────────",
}

-- vim: nowrap
