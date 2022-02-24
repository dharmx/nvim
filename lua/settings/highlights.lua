local highlight = require("highlights.utils.helpers").highlight
local colors = require("highlights.schemes." .. vim.g.current_scheme)

highlight("YankFeed", { foreground = colors.rainbow.cobalt, decoration = "bold" })
