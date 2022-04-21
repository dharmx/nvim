local H = {}

function H.get(colors)
  return {
    ["SymbolsOutlineConnector"] = { guifg = colors.shades.shade02 },
    ["FocusedSymbol"] = { guibg = colors.common.base13, guifg = colors.common.base01 },
  }
end

return H

-- vim:ft=lua
