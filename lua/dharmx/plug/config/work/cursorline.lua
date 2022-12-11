local present, cursorline = pcall(require, "nvim-cursorline")

if not present then return end

cursorline.setup({
  cursorline = {
    enable = false,
    timeout = 400,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 100,
    hl = { underline = true },
  },
})

-- vim:filetype=lua