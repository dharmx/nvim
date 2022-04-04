local R = {}

function R.get(colors)
  return {
    ["packerPackageNotLoaded"] = { foreground = colors.common.base11 },
  }
end

return R

-- vim:ft=lua
