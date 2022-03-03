local R = {}

function R.get(theme)
  return {
    ["packerPackageNotLoaded"] = { foreground = theme.shades.shade00 },
  }
end

return R
