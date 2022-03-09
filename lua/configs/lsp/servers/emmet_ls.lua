local schema = {
  default_config = {
    cmd = { "ls_emmet", "--stdio" },
    filetypes = {
      "html",
      "css",
      "scss",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "haml",
      "xml",
      "xsl",
      "pug",
      "slim",
      "sass",
      "stylus",
      "less",
      "sss",
    },
    root_dir = function(fname)
      return vim.loop.cwd()
    end,
  },
}

return schema

-- vim:ft=lua
