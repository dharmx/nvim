local ok, monark = pcall(require, "monark")
if not ok then return end

monark.setup({
  clear_on_normal = true,
  sticky = true,
  offset = 2,
  timeout = 300,
  i_idle_to = 1000,
  modes = {
    normal = { "", "MonarkNormal" },
    visual = { "", "MonarkVisual" },
    visual_l = { " ", "MonarkVisualLine" },
    visual_b = { " ", "MonarkVisualBlock" },
    select = { " ", "MonarkSelect" },
    insert = { " ", "MonarkInsert" },
    replace = { " ", "MonarkReplace" },
    terminal = { " ", "MonarkTerminal" },
  },
  hl_mode = "combine",
  ignore = { "c" },
})

-- vim:filetype=lua
