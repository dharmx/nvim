return {
  setup = function(colors)
    hi("BookmarkSign", { guifg = colors.common.base13, gui = "bold" })
    hi("BookmarkAnnotationSign", { guifg = colors.common.base07, gui = "bold" })
    hi("BookmarkLine", { guifg = colors.common.base13 })
    hi("BookmarkAnnotationLine", { guifg = colors.common.base09 })
  end,
}

-- vim:ft=lua
