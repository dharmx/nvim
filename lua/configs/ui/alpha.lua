local present, alpha = pcall(require, "alpha")

if not present then
  return
end

local logo = require("tables.banners").SLEEKRAKEN
local config = {}

config["layouts"] = {}

alpha.setup {}

-- vim:ft=lua
