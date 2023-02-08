local ok, truezen = pcall(require, "true-zen")
if not ok then return end

truezen.setup({
  modes = {
    minimalist = {
      options = {
        statusline = "%{%v:lua.require'feline'.generate_statusline()%}",
        cmdheight = 0,
        laststatus = 3,
      },
    },
  },
})

-- vim:filetype=lua
