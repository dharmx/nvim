vim.fn.sign_define("DiagnosticSignError", {
  text = "",
  linehl = "LspDiagnosticsSignError",
  culhl = "LspDiagnosticsSignError",
  numhl = "LspDiagnosticsSignError",
})

vim.fn.sign_define("DiagnosticSignHint", {
  text = "",
  linehl = "LspDiagnosticsSignHint",
  culhl = "LspDiagnosticsSignHint",
  numhl = "LspDiagnosticsSignHint",
})

vim.fn.sign_define("DiagnosticSignInfo", {
  text = "",
  linehl = "LspDiagnosticsSignInfo",
  culhl = "LspDiagnosticsSignInfo",
  numhl = "LspDiagnosticsSignInfo",
})

vim.fn.sign_define("DiagnosticSignWarn", {
  text = "",
  linehl = "LspDiagnosticsSignWarn",
  culhl = "LspDiagnosticsSignWarn",
  numhl = "LspDiagnosticsSignWarn",
})

vim.fn.sign_define("LightBulbSign", {
  text = " ",
  linehl = "LspDiagnosticsSignHint",
  culhl = "LspDiagnosticsSignHint",
  numhl = "LspDiagnosticsSignHint",
})

vim.diagnostic.config({
  virtual_text = { prefix = " ", source = "always" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { source = "always" },
})

-- vim:filetype=lua
