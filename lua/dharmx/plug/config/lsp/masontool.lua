local ok, tool = pcall(require, "mason-tool-installer")
if not ok then return end
local MainConfig = require("dharmx")

tool.setup({
  ensure_installed = MainConfig.tools.tool,
  auto_update = true,
  run_on_start = true,
  start_delay = 3000,
})

-- vim:filetype=lua
