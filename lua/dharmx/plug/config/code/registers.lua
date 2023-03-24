local ok, registers = pcall(require, "registers")
if not ok then return end

registers.setup({
  symbols = {
    newline = "",
    space = " ",
    tab = ">",
    register_type_charwise = "",
    register_type_linewise = "",
    register_type_blockwise = "",
  },
  window = {
    max_width = 100,
    highlight_cursorline = true,
    border = "solid",
    transparency = 0,
  },
  sign_highlights = {
    cursorline = "Visual",
    selection = "Constant",
    default = "Function",
    unnamed = "Statement",
    read_only = "Type",
    expression = "Exception",
    black_hole = "Error",
    alternate_buffer = "Operator",
    last_search = "Tag",
    delete = "Special",
    yank = "Delimiter",
    history = "Number",
    named = "Todo",
  },
})
