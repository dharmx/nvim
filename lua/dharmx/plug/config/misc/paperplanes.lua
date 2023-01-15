local ok, pp = pcall(require, "paperplanes")
if not ok then return end

pp.setup({
  register = "+",
  provider = "dpaste.org",
})
