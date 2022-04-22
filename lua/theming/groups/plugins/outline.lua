return {
  setup = function(colors)
    hi("SymbolsOutlineConnector", { guifg = colors.shades.shade02 })
    hi("FocusedSymbol", { guibg = colors.common.base13, guifg = colors.common.base01 })
  end,
}

-- vim:ft=lua
