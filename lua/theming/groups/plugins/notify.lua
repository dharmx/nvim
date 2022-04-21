local B = {}

function B.get(colors)
  return {
    ["NotifyINFOBody"] = { guibg = colors.shades.shade08, guifg = colors.common.base09 },
    ["NotifyINFOBody2"] = { link = "NotifyINFOBody" },
    ["NotifyINFOBorder"] = { guibg = colors.shades.shade08, guifg = colors.shades.shade08 },
    ["NotifyINFOBorder2"] = { link = "NotifyINFOBody" },
    ["NotifyINFOIcon"] = { guifg = colors.common.base15 },
    ["NotifyINFOIcon2"] = { guifg = colors.common.base09 },
    ["NotifyINFOTitle"] = { guifg = colors.common.base08, gui = "bold" },
    ["NotifyINFOTitle2"] = { guifg = colors.common.base08, gui = "bold" },

    ["NotifyLogTime"] = { guifg = colors.common.base08, gui = "bold" },
    ["NotifyLogTitle"] = { guifg = colors.common.base08, gui = "bold" },

    ["NotifyWARNBody"] = { guifg = colors.common.base01, guibg = colors.common.base13 },
    ["NotifyWARNIcon"] = { guifg = colors.common.base12, guibg = colors.common.base13 },
    ["NotifyWARNTitle"] = {
      guifg = colors.common.base01,
      guibg = colors.common.base13,
      gui = "bold",
    },
    ["NotifyWARNBorder"] = { guifg = colors.common.base13, guibg = colors.common.base13 },

    ["NotifyDebugBody"] = { guifg = colors.common.base01, guibg = colors.common.base15 },
    ["NotifyDebugIcon"] = { guifg = colors.common.base11, guibg = colors.common.base15 },
    ["NotifyDebugTitle"] = {
      guifg = colors.common.base01,
      guibg = colors.common.base15,
      gui = "bold",
    },
    ["NotifyDebugBorder"] = { guifg = colors.common.base15, guibg = colors.common.base15 },

    ["NotifyERRORBody"] = { guibg = colors.common.base01, guifg = colors.common.base11 },
    ["NotifyERRORIcon"] = { guifg = colors.common.base08, guibg = colors.common.base01 },
    ["NotifyERRORTitle"] = {
      guibg = colors.common.base01,
      guifg = colors.common.base11,
      gui = "bold",
    },
    ["NotifyERRORBorder"] = { guibg = colors.common.base01, guifg = colors.common.base01 },

    ["NotifyTRACEBody"] = { guifg = colors.common.base01, guibg = colors.common.base10 },
    ["NotifyTRACEIcon"] = { guifg = colors.common.base14, guibg = colors.common.base10 },
    ["NotifyTRACETitle"] = {
      guifg = colors.common.base01,
      guibg = colors.common.base10,
      gui = "bold",
    },
    ["NotifyTRACEBorder"] = { guifg = colors.common.base10, guibg = colors.common.base10 },
  }
end

return B

-- vim:ft=lua
