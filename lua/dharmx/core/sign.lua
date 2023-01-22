local sign = vim.fn.sign_define

sign("DiagnosticSignError", {
  text = " ",
  linehl = "LspDiagnosticsSignError",
  texthl = "LspDiagnosticsSignError",
  numhl = "LspDiagnosticsSignError",
})

sign("DiagnosticSignHint", {
  text = " ",
  linehl = "LspDiagnosticsSignHint",
  texthl = "LspDiagnosticsSignHint",
  numhl = "LspDiagnosticsSignHint",
})

sign("DiagnosticSignInfo", {
  text = " ",
  linehl = "LspDiagnosticsSignInfo",
  texthl = "LspDiagnosticsSignInfo",
  numhl = "LspDiagnosticsSignInfo",
})

sign("DiagnosticSignWarn", {
  text = " ",
  linehl = "LspDiagnosticsSignWarn",
  texthl = "LspDiagnosticsSignWarn",
  numhl = "LspDiagnosticsSignWarn",
})

sign("LightBulbSign", {
  text = " ",
  linehl = "LspDiagnosticsSignHint",
  texthl = "LspDiagnosticsSignHint",
  numhl = "LspDiagnosticsSignHint",
})

sign("DapBreakpoint", {
  text = " ",
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

sign("DapLogPoint", {
  text = " ",
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

sign("DapBreakpointCondition", {
  text = " ",
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

sign("DapBreakpointRejected", {
  text = " ",
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

sign("DapStopped", {
  text = " ",
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

vim.diagnostic.config({
  virtual_text = { prefix = " ", source = "always" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { source = "always", border = "solid" },
})

-- vim:filetype=lua
