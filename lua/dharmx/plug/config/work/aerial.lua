local ok, aerial = pcall(require, "aerial")
if not ok then return end
local MainConfig = require("dharmx")

aerial.setup({
  ignore = {
    unlisted_buffers = false,
    filetypes = MainConfig.black.filetype,
    buftypes = MainConfig.black.buftype,
  },
  icons = MainConfig.kind.type,
  guides = MainConfig.ui.aerial,
  float = {
    border = MainConfig.ui.border,
  },
})

-- vim:filetype=lua
