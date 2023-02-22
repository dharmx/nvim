local ok, jaq = pcall(require, "jaq")
if not ok then return end

jaq.setup({
  cmds = {
    internal = {
      lua = "luafile %",
      vim = "source %",
    },
    external = {
      markdown = "glow %",
      python = "python3 %",
      go = "go run %",
      sh = "sh %",
    },
  },
  behavior = {
    default = "float",
    startinsert = false,
    wincmd = false,
    autosave = false,
  },
  ui = {
    float = {
      border = "solid",
      winhl = "JaqWin",
      borderhl = "JaqBorder",
      winblend = 0,
      height = 0.8,
      width = 0.8,
      x = 0.5,
      y = 0.5,
    },
    terminal = {
      position = "bot",
      size = 10,
      line_no = false,
    },
    quickfix = {
      position = "bot",
      size = 10,
    },
  },
})
