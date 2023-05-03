return setmetatable({}, {
  __index = function(_, item) return require("dharmx.utils." .. item) end,
})
