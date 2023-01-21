local ok, outline = pcall(require, "symbols-outline")
if not ok then return end
local kind = require("dharmx.util.kind").sleek

local symbols = {
  File = { hl = "TSURI" },
  Module = { hl = "TSNamespace" },
  Namespace = { hl = "TSNamespace" },
  Package = { hl = "TSNamespace" },
  Class = { hl = "TSType" },
  Method = { hl = "TSMethod" },
  Property = { hl = "TSMethod" },
  Field = { hl = "TSField" },
  Constructor = { hl = "TSConstructor" },
  Enum = { hl = "TSType" },
  Interface = { hl = "TSType" },
  Function = { hl = "TSFunction" },
  Variable = { hl = "TSConstant" },
  Constant = { hl = "TSConstant" },
  String = { hl = "TSString" },
  Number = { hl = "TSNumber" },
  Boolean = { hl = "TSBoolean" },
  Array = { hl = "TSConstant" },
  Object = { hl = "TSType" },
  Key = { hl = "TSType" },
  Null = { hl = "TSType" },
  EnumMember = { hl = "TSField" },
  Struct = { hl = "TSType" },
  Event = { hl = "TSType" },
  Operator = { hl = "TSOperator" },
  TypeParameter = { hl = "TSParameter" },
}

for kind_name, _ in pairs(symbols) do
  symbols[kind_name].icon = kind[kind_name]
end

outline.setup({
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true,
  position = "right",
  relative_width = true,
  width = 25,
  auto_close = true,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = "Pmenu",
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { "", "" },
  wrap = false,
  keymaps = {
    close = { "<Esc>", "q" },
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  symbols = symbols,
})

-- vim:filetype=lua
