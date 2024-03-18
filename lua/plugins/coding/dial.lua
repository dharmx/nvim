local ok, dial = pcall(require, "dial.config")
if not ok then return end

local map = require("dial.map")
local augend = require("dial.augend")

vim.keymap.set("n", "<C-a>", map.inc_normal())
vim.keymap.set("n", "<C-x>", map.dec_normal())
vim.keymap.set("v", "<C-a>", map.inc_visual())
vim.keymap.set("v", "<C-x>", map.dec_visual())
vim.keymap.set("v", "g<C-a>", map.inc_gvisual())
vim.keymap.set("v", "g<C-x>", map.dec_gvisual())

local Bool = augend.constant.new({
  elements = {
    "True",
    "False",
  },
})

local BOOL = augend.constant.new({
  elements = {
    "TRUE",
    "FALSE",
  },
})

dial.augends:register_group({
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.alias.bool,
    Bool,
    BOOL,
    augend.constant.alias.Alpha,
    augend.constant.alias.alpha,
    augend.date.alias["%Y/%m/%d"],
    augend.date.alias["%m/%d/%Y"],
    augend.hexcolor.new({
      case = "lower",
      cyclic = true,
    }),
    augend.constant.new({
      elements = { "and", "or" },
      word = true,
      cyclic = true,
    }),
    augend.constant.new({
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    }),
    augend.constant.new({
      elements = { "[x]", "[ ]" },
      word = false,
      cyclic = true,
    }),
  },
})
