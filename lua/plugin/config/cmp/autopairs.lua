local present, autopairs = pcall(require, "nvim-autopairs")

if not present then
  return
end

local config = {
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
  disable_filetype = require("tables.blacklisted").hidden,
  enable_check_bracket_line = true,
}

autopairs.setup(config)
_ = require("plugin.config.cmp.rules")

-- vim:ft=lua
