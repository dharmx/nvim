local colors = require("utils.theming").get_active_theme()

return {
  ["LspDiagnosticsSignError"] = {
    fg = colors.syntax.color17,
  },
  ["LspDiagnosticsFloatingError"] = {
    fg = colors.syntax.color17,
  },
  ["LspDiagnosticsVirtualTextError"] = {
    fg = colors.syntax.color17,
  },
  ["LspDiagnosticsUnderlineError"] = {
    undercurl = true,
    bold = true,
    sp = colors.syntax.color17,
  },
  ["LspDiagnosticsDefaultWarning"] = {
    fg = colors.syntax.color08,
  },
  ["LspDiagnosticsDefaultError"] = {
    fg = colors.syntax.color01,
  },
  ["LspDiagnosticsSignWarning"] = {
    fg = colors.syntax.color08,
  },
  ["LspDiagnosticsFloatingWarning"] = {
    fg = colors.syntax.color08,
    bold = true,
  },
  ["LspDiagnosticsVirtualTextWarning"] = {
    fg = colors.syntax.color08,
    bold = true,
  },
  ["LspDiagnosticsUnderlineWarning"] = {
    undercurl = true,
    sp = colors.syntax.color08,
  },
  ["LspDiagnosticsDefaultInformation"] = {
    fg = colors.syntax.color13,
    italic = true,
  },
  ["LspDiagnosticsSignInformation"] = {
    fg = colors.syntax.color13,
  },
  ["LspDiagnosticsFloatingInformation"] = {
    fg = colors.syntax.color13,
  },
  ["LspDiagnosticsVirtualTextInformation"] = {
    fg = colors.syntax.color13,
    italic = true,
  },
  ["LspDiagnosticsUnderlineInformation"] = {
    undercurl = true,
    sp = colors.syntax.color13,
  },
  ["LspDiagnosticsDefaultHint"] = {
    fg = colors.syntax.color09,
  },
  ["LspDiagnosticsSignHint"] = {
    fg = colors.syntax.color09,
  },
  ["LspDiagnosticsFloatingHint"] = {
    fg = colors.syntax.color09,
  },
  ["LspDiagnosticsVirtualTextHint"] = {
    fg = colors.syntax.color09,
  },
  ["LspDiagnosticsUnderlineHint"] = {
    undercurl = true,
    sp = colors.syntax.color09,
  },
  ["LspReferenceText"] = {
    fg = colors.syntax.color12,
    bg = colors.common.base01,
    bold = true,
  },
  ["LspReferenceRead"] = {
    fg = colors.syntax.color16,
    bg = colors.common.base01,
    bold = true,
  },
  ["LspReferenceWrite"] = {
    fg = colors.syntax.color06,
    bg = colors.common.base01,
    bold = true,
  },
  ["DiagnosticError"] = {
    link = "LspDiagnosticsDefaultError",
  },
  ["DiagnosticWarn"] = {
    link = "LspDiagnosticsDefaultWarning",
  },
  ["DiagnosticInfo"] = {
    link = "LspDiagnosticsDefaultInformation",
  },
  ["DiagnosticHint"] = {
    link = "LspDiagnosticsDefaultHint",
  },
  ["DiagnosticVirtualTextWarn"] = {
    link = "LspDiagnosticsVirtualTextWarning",
  },
  ["DiagnosticUnderlineWarn"] = {
    link = "LspDiagnosticsUnderlineWarning",
  },
  ["DiagnosticFloatingWarn"] = {
    link = "LspDiagnosticsFloatingWarning",
  },
  ["DiagnosticSignWarn"] = {
    link = "LspDiagnosticsSignWarning",
  },
  ["DiagnosticVirtualTextError"] = {
    link = "LspDiagnosticsVirtualTextError",
  },
  ["DiagnosticUnderlineError"] = {
    link = "LspDiagnosticsUnderlineError",
  },
  ["DiagnosticFloatingError"] = {
    link = "LspDiagnosticsFloatingError",
  },
  ["DiagnosticSignError"] = {
    link = "LspDiagnosticsSignError",
  },
  ["DiagnosticVirtualTextInfo"] = {
    link = "LspDiagnosticsVirtualTextInformation",
  },
  ["DiagnosticUnderlineInfo"] = {
    link = "LspDiagnosticsUnderlineInformation",
  },
  ["DiagnosticFloatingInfo"] = {
    link = "LspDiagnosticsFloatingInformation",
  },
  ["DiagnosticSignInfo"] = {
    link = "LspDiagnosticsSignInformation",
  },
  ["DiagnosticVirtualTextHint"] = {
    link = "LspDiagnosticsVirtualTextHint",
  },
  ["DiagnosticUnderlineHint"] = {
    link = "LspDiagnosticsUnderlineHint",
  },
  ["DiagnosticFloatingHint"] = {
    link = "LspDiagnosticsFloatingHint",
  },
}

-- vim:ft=lua
