local ok, dial = pcall(require, "dial.config")
if not ok then return end

local util = require("dharmx.utils.map")
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
local map = require("dial.map")
local augend = require("dial.augend")

nnoremap("<C-a>", map.inc_normal())
nnoremap("<C-x>", map.dec_normal())
vnoremap("<C-a>", map.inc_visual())
vnoremap("<C-x>", map.dec_visual())
vnoremap("g<C-a>", map.inc_gvisual())
vnoremap("g<C-x>", map.dec_gvisual())

dial.augends:register_group({
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.alias.bool,
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
  },
})
