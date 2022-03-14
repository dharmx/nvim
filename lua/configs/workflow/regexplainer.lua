local present, rgxplain = pcall(require, "regexplainer")

if not present then
  return
end

local config = {
  mode = "narrative", -- TODO: 'ascii', 'graphical'
  auto = true,
  debug = false,
  display = "popup", -- NOTE: 'split', 'popup'
  mappings = require("mappings").nvim_regexplainer,
  narrative = {
    separator = "\n",
  },
}

rgxplain.setup(config)

-- vim:ft=lua
