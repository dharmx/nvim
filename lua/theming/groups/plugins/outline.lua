local H = {}

function H.get(colors)
  return {
    ["SymbolsOutlineConnector"] = { foreground = colors.shades.shade02 },
    ["FocusedSymbol"] = { background = colors.common.base13, foreground = colors.common.base01 },
  }
end

return H

-- vim:ft=lua
