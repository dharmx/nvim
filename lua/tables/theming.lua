local E = {}

local function prepare_plugin(plugin)
  return require("theming.groups.plugins." .. plugin)
end

local function prepare_syntax(language)
  return require("theming.groups.syntax." .. language)
end

E.base = {
  ["lua"] = prepare_syntax("lua").get,
  ["general"] = prepare_syntax("general").get,
  ["markdown"] = prepare_syntax("markdown").get,
  ["html"] = prepare_syntax("html").get,
  ["terminal"] = require("theming.groups.terminal").set,
  ["ui"] = require("theming.groups.ui").get,
  ["custom"] = require("theming.groups.custom").get,
  ["statusline"] = require("theming.groups.statusline").get,
}

E.supports = {
  theme = {
    ["blankline"] = prepare_plugin("blankline").get,
    ["bufferline"] = prepare_plugin("bufferline").get,
    ["gitsigns"] = prepare_plugin("gitsigns").get,
    ["neogit"] = prepare_plugin("neogit").get,
    ["hop"] = prepare_plugin("hop").get,
    ["trouble"] = prepare_plugin("trouble").get,
    ["diff"] = prepare_plugin("diff").get,
    ["whichkey"] = prepare_plugin("whichkey").get,
    ["telescope"] = prepare_plugin("telescope").get,
    ["alpha"] = prepare_plugin("alpha").get,
    ["rainbow"] = prepare_plugin("rainbow").get,
    ["todo"] = prepare_plugin("todo").get,
    ["nvimtree"] = prepare_plugin("nvimtree").get,
    ["notify"] = prepare_plugin("notify").get,
    ["packer"] = prepare_plugin("packer").get,
    ["outline"] = prepare_plugin("outline").get,
    ["lightbulb"] = prepare_plugin("lightbulb").get,
    ["rnvimr"] = prepare_plugin("rnvimr").get,
    ["bookmarks"] = prepare_plugin("bookmarks").get,
    ["treesitter"] = prepare_plugin("treesitter").get,
  },
  syntax = {
    ["cmp"] = prepare_plugin("cmp").get,
    ["lsp"] = prepare_plugin("lsp").get,
  },
}

return E

-- vim:ft=lua
