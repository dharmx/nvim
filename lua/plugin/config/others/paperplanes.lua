local present, pp = pcall(require, "paperplanes")

if not present then
  return
end

pp.setup({
  register = "+",
  provider = "dpaste.org",
})
