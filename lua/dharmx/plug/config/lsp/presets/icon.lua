local config = require("dharmx")

vim.fn.sign_define("DiagnosticSignError", {
  text = config.sign.errors,
  linehl = "LspDiagnosticsSignError",
  culhl = "LspDiagnosticsSignError",
  numhl = "LspDiagnosticsSignError",
})

vim.fn.sign_define("DiagnosticSignHint", {
  text = config.hints,
  linehl = "LspDiagnosticsSignHint",
  culhl = "LspDiagnosticsSignHint",
  numhl = "LspDiagnosticsSignHint",
})

vim.fn.sign_define("DiagnosticSignInfo", {
  text = config.info,
  linehl = "LspDiagnosticsSignInfo",
  culhl = "LspDiagnosticsSignInfo",
  numhl = "LspDiagnosticsSignInfo",
})

vim.fn.sign_define("DiagnosticSignWarn", {
  text = config.warning,
  linehl = "LspDiagnosticsSignWarn",
  culhl = "LspDiagnosticsSignWarn",
  numhl = "LspDiagnosticsSignWarn",
})

vim.fn.sign_define("LightBulbSign", {
  text = config.bulb,
  linehl = "LspDiagnosticsSignHint",
  culhl = "LspDiagnosticsSignHint",
  numhl = "LspDiagnosticsSignHint",
})

vim.diagnostic.config({
  virtual_text = { prefix = config.diagnostic, source = "always" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { source = "always" },
})

-- vim:filetype=lua
