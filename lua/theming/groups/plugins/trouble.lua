local T = {}

function T.get(theme)
  return {
    ["TroubleNormal"] = { background = theme.shades.shade07 },
  }
end

return T

-- vim:ft=lua
