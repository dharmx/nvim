local M = {}

M["a"] = {
  description = { "  Find File                 SPC t f" },
  command = "Telescope find_files",
}

M["b"] = {
  description = { "  Recents                   SPC t h" },
  command = "Telescope oldfiles",
}

M["c"] = {
  description = { "  Find Word                 SPC t w" },
  command = "Telescope live_grep",
}

M["d"] = {
  description = { "洛 New File                  SPC f n" },
  command = "DashboardNewFile",
}

M["e"] = {
  description = { "  Last Session              SPC s l" },
  command = "SessionLoad",
}

M["f"] = {
  description = { "  Media Files               SPC t i" },
  command = "Telescope media_files",
}

M["g"] = {
  description = { "  Todo Lists                SPC t l" },
  command = "TodoTrouble",
}

M["h"] = {
  description = { "  Plugins                   SPC t p" },
  command = "PackerStatus",
}

M["i"] = {
  description = { "  Symbols                   SPC t s" },
  command = "Telescope symbols",
}

M["j"] = {
  description = { "  Keymaps                   SPC t k" },
  command = "Telescope keymaps",
}

return M

-- vim:ft=lua
