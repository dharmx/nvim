local R = {}

function R.get(colors)
  return {
    ["packerPackageNotLoaded"] = { guifg = colors.common.base11 },
  }
end

return R

-- vim:ft=lua
