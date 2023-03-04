local F = vim.fn
local util = require("dharmx.util").nvim

local function open(value)
  if not value:match("^https://.+") then
    vim.notify("Invalid entry.")
  else
    local raw = F.system({ "curl", "--silent", "https://is.gd/create.php?format=simple&url=" .. value })
    if F.setreg(vim.v.register, raw) == 0 then vim.notify([["0 ]] .. raw) end
  end
end

return {
  open = function(value)
    if value then
      open(value == "<cword>" and vim.fn.expand(value) or value)
      return
    end
    util.input({ size = 50 }, {
      prompt = "   ",
      default_value = "Your URL...",
      on_submit = open,
    })
  end,
}
