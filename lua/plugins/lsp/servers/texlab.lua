local schema = {
  texlab = {
    auxDirectory = ".",
    bibtexFormatter = "texlab",
    build = {
      args = { "-f", "-shell-escape", "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
      executable = "latexmk",
      forwardSearchAfter = false,
      onSave = false,
    },
    chktex = {
      onEdit = false,
      onOpenAndSave = false,
    },
    lint = {
      onChange = false,
      onSave = false,
    },
    diagnosticsDelay = 300,
    formatterLineLength = 80,
    forwardSearch = {
      args = {},
    },
    latexFormatter = "latexindent",
    latexindent = {
      modifyLineBreaks = false,
    },
  },
}

return schema
