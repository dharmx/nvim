return setmetatable({}, {
  __index = function(_, item) return require("dharmx.util." .. item) end,
})
