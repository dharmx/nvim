local ok, oil = pcall(require, "oil")
if not ok then return end

oil.setup({
  columns = {
    "icon",
  },
})
