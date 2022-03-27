local E = {}

local function _prepare_plugin(plugin)
  return require("theming.groups.plugins." .. plugin)
end

local function _prepare_syntax(language)
  return require("theming.groups.syntax." .. language)
end

E.base = {
  ["lua"] = _prepare_syntax("lua").get,
  ["general"] = _prepare_syntax("general").get,
  ["markdown"] = _prepare_syntax("markdown").get,
  ["html"] = _prepare_syntax("html").get,
  ["terminal"] = require("theming.groups.terminal").set,
  ["ui"] = require("theming.groups.ui").get,
  ["custom"] = require("theming.groups.custom").get,
  ["statusline"] = require("theming.groups.statusline").get,
}

E.supports = {
  theme = {
    ["blankline"] = _prepare_plugin("blankline").get,
    ["bufferline"] = _prepare_plugin("bufferline").get,
    ["gitsigns"] = _prepare_plugin("gitsigns").get,
    ["neogit"] = _prepare_plugin("neogit").get,
    ["hop"] = _prepare_plugin("hop").get,
    ["trouble"] = _prepare_plugin("trouble").get,
    ["diff"] = _prepare_plugin("diff").get,
    ["whichkey"] = _prepare_plugin("whichkey").get,
    ["telescope"] = _prepare_plugin("telescope").get,
    ["alpha"] = _prepare_plugin("alpha").get,
    ["rainbow"] = _prepare_plugin("rainbow").get,
    ["todo"] = _prepare_plugin("todo").get,
    ["nvimtree"] = _prepare_plugin("nvimtree").get,
    ["notify"] = _prepare_plugin("notify").get,
    ["packer"] = _prepare_plugin("packer").get,
    ["outline"] = _prepare_plugin("outline").get,
    ["lightbulb"] = _prepare_plugin("lightbulb").get,
  },
  syntax = {
    ["cmp"] = _prepare_plugin("cmp").get,
    ["lsp"] = _prepare_plugin("lsp").get,
  },
}

return E

-- vim:ft=lua
