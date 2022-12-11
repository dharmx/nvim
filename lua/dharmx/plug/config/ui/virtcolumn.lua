local present, virtcol = pcall(require, "virt-column")

if not present then return end

virtcol.setup({ char = "┃" })

-- vim:filetype=lua
