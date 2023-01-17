local ok, monark = pcall(require, "monark")
if not ok then return end
local MainConfig = require("dharmx")

monark.setup({
  clear_on_normal = true,
  sticky = true,
  offset = 2,
  timeout = 300,
  i_idle_to = 1000,
  modes = {
    normal = { MainConfig.ui.monark.normal, "MonarkNormal" },
    visual = { MainConfig.ui.monark.visual, "MonarkVisual" },
    visual_l = { MainConfig.ui.monark.line, "MonarkVisualLine" },
    visual_b = { MainConfig.ui.monark.block, "MonarkVisualBlock" },
    select = { MainConfig.ui.monark.select, "MonarkSelect" },
    insert = { MainConfig.ui.monark.insert, "MonarkInsert" },
    replace = { MainConfig.ui.monark.replace, "MonarkReplace" },
    terminal = { MainConfig.ui.monark.terminal, "MonarkTerminal" },
  },
  hl_mode = "combine",
  ignore = { "c" },
})

-- vim:filetype=lua
