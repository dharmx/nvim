local present, reach = pcall(require, "reach")

if not present then
  return
end

local config = {
  notifications = true,
}

reach.setup(config)

-- vim:ft=lua
