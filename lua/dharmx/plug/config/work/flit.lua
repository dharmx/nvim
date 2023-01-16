local ok, flit = pcall(require, "flit")
if not ok then return end

flit.setup({
  keys = { f = "f", F = "F", t = "t", T = "T" },
  labeled_modes = "v",
  multiline = true,
})

-- vim:filetype=lua
