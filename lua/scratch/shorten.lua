local A = vim.api
local util = require("dharmx.util").nvim
local format = [[!curl --silent "https://is.gd/create.php?format=simple&url=%s"]]

util.input({
  position = { row = 5, col = 5 },
  size = 50,
  border = { style = "solid" },
}, {
  prompt = "   ",
  default_value = "Your URL...",
  on_submit = function(value)
    local raw = vim.split(A.nvim_exec(string.format(format, value), true), "\n", { plain = true })
    if value == "Your URL..." then
      vim.api.nvim_notify("ERROR: Couldn't fetch the shortened URL!", vim.log.levels.ERROR, {
        icon = " ",
        title = "URL Shortner",
      })
    else
      vim.fn.setreg(vim.v.register, raw[#raw])
      vim.api.nvim_notify("Saved link to system clipboard!", vim.log.levels.INFO, {
        icon = " ",
        title = "URL Shortner",
      })
    end
  end,
})
