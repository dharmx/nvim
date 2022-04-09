local L = {}

function L.get(colors)
  return {
    ["LspDiagnosticsDefaultError"] = { foreground = colors.syntax.color17 },
    ["LspDiagnosticsSignError"] = { foreground = colors.syntax.color17 },
    ["LspDiagnosticsFloatingError"] = { foreground = colors.syntax.color17 },
    ["LspDiagnosticsVirtualTextError"] = { foreground = colors.syntax.color17 },
    ["LspDiagnosticsUnderlineError"] = {
      decoration = "undercurl",
      special = colors.syntax.color17,
    },
    ["LspDiagnosticsDefaultWarning"] = { foreground = colors.syntax.color08 },
    ["LspDiagnosticsSignWarning"] = { foreground = colors.syntax.color08 },
    ["LspDiagnosticsFloatingWarning"] = { foreground = colors.syntax.color08 },
    ["LspDiagnosticsVirtualTextWarning"] = { foreground = colors.syntax.color08 },
    ["LspDiagnosticsUnderlineWarning"] = {
      decoration = "undercurl",
      special = colors.syntax.color08,
    },
    ["LspDiagnosticsDefaultInformation"] = { foreground = colors.syntax.color13 },
    ["LspDiagnosticsSignInformation"] = { foreground = colors.syntax.color13 },
    ["LspDiagnosticsFloatingInformation"] = { foreground = colors.syntax.color13 },
    ["LspDiagnosticsVirtualTextInformation"] = { foreground = colors.syntax.color13 },
    ["LspDiagnosticsUnderlineInformation"] = {
      decoration = "undercurl",
      special = colors.syntax.color13,
    },
    ["LspDiagnosticsDefaultHint"] = { foreground = colors.syntax.color09 },
    ["LspDiagnosticsSignHint"] = { foreground = colors.syntax.color09 },
    ["LspDiagnosticsFloatingHint"] = { foreground = colors.syntax.color09 },
    ["LspDiagnosticsVirtualTextHint"] = { foreground = colors.syntax.color09 },
    ["LspDiagnosticsUnderlineHint"] = {
      decoration = "undercurl",
      special = colors.syntax.color09,
    },

    ["LspReferenceText"] = { foreground = colors.syntax.color12, background = colors.common.base01 },
    ["LspReferenceRead"] = { foreground = colors.syntax.color16, background = colors.common.base01 },
    ["LspReferenceWrite"] = { foreground = colors.syntax.color06, background = colors.common.base01 },

    ["DiagnosticError"] = { link = "LspDiagnosticsDefaultError" },
    ["DiagnosticWarn"] = { link = "LspDiagnosticsDefaultWarning" },
    ["DiagnosticInfo"] = { link = "LspDiagnosticsDefaultInformation" },
    ["DiagnosticHint"] = { link = "LspDiagnosticsDefaultHint" },
    ["DiagnosticVirtualTextWarn"] = { link = "LspDiagnosticsVirtualTextWarning" },
    ["DiagnosticUnderlineWarn"] = { link = "LspDiagnosticsUnderlineWarning" },
    ["DiagnosticFloatingWarn"] = { link = "LspDiagnosticsFloatingWarning" },
    ["DiagnosticSignWarn"] = { link = "LspDiagnosticsSignWarning" },
    ["DiagnosticVirtualTextError"] = { link = "LspDiagnosticsVirtualTextError" },
    ["DiagnosticUnderlineError"] = { link = "LspDiagnosticsUnderlineError" },
    ["DiagnosticFloatingError"] = { link = "LspDiagnosticsFloatingError" },
    ["DiagnosticSignError"] = { link = "LspDiagnosticsSignError" },
    ["DiagnosticVirtualTextInfo"] = {
      link = "LspDiagnosticsVirtualTextInformation",
    },
    ["DiagnosticUnderlineInfo"] = { link = "LspDiagnosticsUnderlineInformation" },
    ["DiagnosticFloatingInfo"] = { link = "LspDiagnosticsFloatingInformation" },
    ["DiagnosticSignInfo"] = { link = "LspDiagnosticsSignInformation" },
    ["DiagnosticVirtualTextHint"] = { link = "LspDiagnosticsVirtualTextHint" },
    ["DiagnosticUnderlineHint"] = { link = "LspDiagnosticsUnderlineHint" },
    ["DiagnosticFloatingHint"] = { link = "LspDiagnosticsFloatingHint" },
  }
end

return L

-- vim:ft=lua
