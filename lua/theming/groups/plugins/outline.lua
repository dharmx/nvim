local H = {}

function H.get(theme)
  return {
    ["SymbolsOutlineConnector"] = { foreground = theme.shades.shade02 },
    ["FocusedSymbol"] = { background = theme.common.base13, foreground = theme.common.base01 },
  }
end

return H

-- vim:ft=lua
