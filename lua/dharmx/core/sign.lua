local MainConfig = require("dharmx")
local sign = vim.fn.sign_define

sign("DiagnosticSignError", {
  text = MainConfig.ui.sign.errors,
  linehl = "LspDiagnosticsSignError",
  texthl = "LspDiagnosticsSignError",
  numhl = "LspDiagnosticsSignError",
})

sign("DiagnosticSignHint", {
  text = MainConfig.ui.sign.hints,
  linehl = "LspDiagnosticsSignHint",
  texthl = "LspDiagnosticsSignHint",
  numhl = "LspDiagnosticsSignHint",
})

sign("DiagnosticSignInfo", {
  text = MainConfig.ui.sign.info,
  linehl = "LspDiagnosticsSignInfo",
  texthl = "LspDiagnosticsSignInfo",
  numhl = "LspDiagnosticsSignInfo",
})

sign("DiagnosticSignWarn", {
  text = MainConfig.ui.sign.warning,
  linehl = "LspDiagnosticsSignWarn",
  texthl = "LspDiagnosticsSignWarn",
  numhl = "LspDiagnosticsSignWarn",
})

sign("LightBulbSign", {
  text = MainConfig.ui.sign.bulb,
  linehl = "LspDiagnosticsSignHint",
  texthl = "LspDiagnosticsSignHint",
  numhl = "LspDiagnosticsSignHint",
})

sign("DapBreakpoint", {
  text = MainConfig.ui.sign.breakpoint,
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

sign("DapLogPoint", {
  text = MainConfig.ui.sign.logpoint,
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

sign("DapBreakpointCondition", {
  text = MainConfig.ui.sign.condition,
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

sign("DapBreakpointRejected", {
  text = MainConfig.ui.sign.rejected,
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

sign("DapStopped", {
  text = MainConfig.ui.sign.stopped,
  texthl = "ErrorMsg",
  linehl = "ErrorMsg",
  numhl = "ErrorMsg",
})

vim.diagnostic.config({
  virtual_text = { prefix = MainConfig.ui.sign.diagnostic, source = "always" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { source = "always" },
})

-- vim:filetype=lua
