local E = {}

E.base = {
  ["lua"] = theming.prepare_syntax("lua").get,
  ["general"] = theming.prepare_syntax("general").get,
  ["markdown"] = theming.prepare_syntax("markdown").get,
  ["html"] = theming.prepare_syntax("html").get,
  ["terminal"] = require("theming.groups.terminal").set,
  ["ui"] = require("theming.groups.ui").get,
  ["custom"] = require("theming.groups.custom").get,
  ["statusline"] = require("theming.groups.statusline").get,
}

E.supports = {
  theme = {
    ["blankline"] = theming.prepare_plugin("blankline").get,
    ["bufferline"] = theming.prepare_plugin("bufferline").get,
    ["gitsigns"] = theming.prepare_plugin("gitsigns").get,
    ["neogit"] = theming.prepare_plugin("neogit").get,
    ["hop"] = theming.prepare_plugin("hop").get,
    ["trouble"] = theming.prepare_plugin("trouble").get,
    ["diff"] = theming.prepare_plugin("diff").get,
    ["whichkey"] = theming.prepare_plugin("whichkey").get,
    ["telescope"] = theming.prepare_plugin("telescope").get,
    ["alpha"] = theming.prepare_plugin("alpha").get,
    ["rainbow"] = theming.prepare_plugin("rainbow").get,
    ["todo"] = theming.prepare_plugin("todo").get,
    ["nvimtree"] = theming.prepare_plugin("nvimtree").get,
    ["notify"] = theming.prepare_plugin("notify").get,
    ["packer"] = theming.prepare_plugin("packer").get,
    ["outline"] = theming.prepare_plugin("outline").get,
    ["lightbulb"] = theming.prepare_plugin("lightbulb").get,
    ["rnvimr"] = theming.prepare_plugin("rnvimr").get,
    ["bookmarks"] = theming.prepare_plugin("bookmarks").get,
    ["treesitter"] = theming.prepare_plugin("treesitter").get,
  },
  syntax = {
    ["cmp"] = theming.prepare_plugin("cmp").get,
    ["lsp"] = theming.prepare_plugin("lsp").get,
  },
}

return E

-- vim:ft=lua
