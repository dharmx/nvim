local ok, alpha = pcall(require, "alpha")
if not ok then return end

alpha.setup(require("colo.extensions.alpha").config)
