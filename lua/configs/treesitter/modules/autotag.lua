local M = {
  enable = false,
  filetypes = {
    "html",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "vue",
  },
  skip_tags = {
    "area",
    "base",
    "br",
    "col",
    "command",
    "embed",
    "hr",
    "img",
    "slot",
    "input",
    "keygen",
    "link",
    "meta",
    "param",
    "source",
    "track",
    "wbr",
    "menuitem",
  },
}

return M

-- vim:ft=lua
