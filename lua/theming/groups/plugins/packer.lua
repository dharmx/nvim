local R = {}

function R.get(theme)
  return {
    ["packerPackageNotLoaded"] = { foreground = theme.common.base11 },
  }
end

return R

-- vim:ft=lua
