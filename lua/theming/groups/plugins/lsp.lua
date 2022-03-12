local L = {}

function L.get(syntax)
  return {
    LspDiagnosticsDefaultError = { foreground = syntax.color17 },
    LspDiagnosticsSignError = { foreground = syntax.color17 },
    LspDiagnosticsFloatingError = { foreground = syntax.color17 },
    LspDiagnosticsVirtualTextError = { foreground = syntax.color17 },
    LspDiagnosticsUnderlineError = {
      decoration = "undercurl",
      special = syntax.color17,
    },
    LspDiagnosticsDefaultWarning = { foreground = syntax.color08 },
    LspDiagnosticsSignWarning = { foreground = syntax.color08 },
    LspDiagnosticsFloatingWarning = { foreground = syntax.color08 },
    LspDiagnosticsVirtualTextWarning = { foreground = syntax.color08 },
    LspDiagnosticsUnderlineWarning = {
      decoration = "undercurl",
      special = syntax.color08,
    },
    LspDiagnosticsDefaultInformation = { foreground = syntax.color19 },
    LspDiagnosticsSignInformation = { foreground = syntax.color19 },
    LspDiagnosticsFloatingInformation = { foreground = syntax.color19 },
    LspDiagnosticsVirtualTextInformation = { foreground = syntax.color19 },
    LspDiagnosticsUnderlineInformation = {
      decoration = "undercurl",
      special = syntax.color19,
    },
    LspDiagnosticsDefaultHint = { foreground = syntax.color10 },
    LspDiagnosticsSignHint = { foreground = syntax.color10 },
    LspDiagnosticsFloatingHint = { foreground = syntax.color10 },
    LspDiagnosticsVirtualTextHint = { foreground = syntax.color10 },
    LspDiagnosticsUnderlineHint = {
      decoration = "undercurl",
      special = syntax.color19,
    },
    LspReferenceText = { foreground = syntax.color12, background = syntax.color14 },
    LspReferenceRead = { foreground = syntax.color16, background = syntax.color14 },
    LspReferenceWrite = { foreground = syntax.color06, background = syntax.color14 },

    DiagnosticError = { link = "LspDiagnosticsDefaultError" },
    DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
    DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
    DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
    DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
    DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
    DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
    DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
    DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
    DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
    DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
    DiagnosticSignError = { link = "LspDiagnosticsSignError" },
    DiagnosticVirtualTextInfo = {
      link = "LspDiagnosticsVirtualTextInformation",
    },
    DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
    DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
    DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
    DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
    DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
    DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
    DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
  }
end

return L

-- vim:ft=lua
