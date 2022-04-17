local T = {}

function T.get(colors)
  return {
    ["TroubleNormal"] = { guibg = colors.shades.shade08 },
  }
end

return T

-- vim:ft=lua
