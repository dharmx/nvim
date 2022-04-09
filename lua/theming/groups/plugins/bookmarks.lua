local H = {}

function H.get(colors)
  return {
    ["BookmarkSign"] = { foreground = colors.common.base13, decoration = "bold" },
    ["BookmarkAnnotationSign"] = { foreground = colors.common.base07, decoration = "bold" },
    ["BookmarkLine"] = { foreground = colors.common.base13 },
    ["BookmarkAnnotationLine"] = { foreground = colors.common.base09 },
  }
end

return H

-- vim:ft=lua
