local ok, marks = pcall(require, "marks")
if not ok then return end

marks.setup({
  default_mappings = true,
})
