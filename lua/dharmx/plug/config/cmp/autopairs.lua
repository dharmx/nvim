local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then return end
local MainConfig = require("dharmx")

autopairs.setup({
  check_ts = true,
  close_triple_quotes = true,
  ts_config = {
    lua = { "string" },
    python = { "string" },
    javascript = { "template_string" },
  },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'", "<" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
  },
  disable_filetype = MainConfig.black.filetype,
  enable_check_bracket_line = true,
})
require("dharmx.plug.config.cmp.rules")

-- vim:filetype=lua
