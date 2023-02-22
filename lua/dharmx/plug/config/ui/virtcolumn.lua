local ok, virtcol = pcall(require, "virt-column")
if not ok then return end

virtcol.setup({ char = "┃" })
