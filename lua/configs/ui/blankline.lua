local present, blankline = pcall(require, "indent_blankline")

if not present then
  return
end

local config = {
  char = "│",
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
  },
  space_char_blankline = " ",
  buftype_exclude = { "terminal" },
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
}

local presets = {}

presets.shaded = function()
  hi("IndentBlanklineIndent1", {
    guifg = colors.shades.shade06,
    guibg = colors.shades.shade06,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndent2", {
    guifg = colors.common.base00,
    guibg = colors.common.base00,
    gui = "nocombine",
  })

  hi("IndentBlanklineIndent3", {
    guibg = colors.shades.shade06,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndent4", {
    guibg = colors.common.base00,
    gui = "nocombine",
  })

  config.space_char_highlight_list = {
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
  }
  config.char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  }
end

presets.rainbow = function()
  hi("IndentBlanklineIndent1", { guifg = colors.rainbow.pink, gui = "nocombine" })
  hi("IndentBlanklineIndent2", { guifg = colors.rainbow.cyan, gui = "nocombine" })
  hi("IndentBlanklineIndent3", { guifg = colors.rainbow.green, gui = "nocombine" })
  hi("IndentBlanklineIndent4", { guifg = colors.rainbow.purple, gui = "nocombine" })
  hi("IndentBlanklineIndent5", { guifg = colors.rainbow.cobalt, gui = "nocombine" })
  hi("IndentBlanklineIndent6", { guifg = colors.rainbow.yellow, gui = "nocombine" })
  hi("IndentBlanklineIndent7", { guifg = colors.rainbow.orange, gui = "nocombine" })

  config.char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
    "IndentBlanklineIndent7",
  }
end

presets.rshaded = function()
  hi("IndentBlanklineIndentS1", {
    guifg = colors.rainbow.cobalt,
    guibg = colors.rainbow.cobalt,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentS2", {
    guifg = colors.rainbow.pink,
    guibg = colors.rainbow.pink,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentS3", {
    guifg = colors.rainbow.cyan,
    guibg = colors.rainbow.cyan,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentS4", {
    guifg = colors.rainbow.green,
    guibg = colors.rainbow.green,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentS5", {
    guifg = colors.rainbow.purple,
    guibg = colors.rainbow.purple,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentS6", {
    guifg = colors.rainbow.yellow,
    guibg = colors.rainbow.yellow,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentS7", {
    guifg = colors.rainbow.orange,
    guibg = colors.rainbow.orange,
    gui = "nocombine",
  })

  hi("IndentBlanklineIndentF1", {
    guibg = colors.rainbow.cobalt,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentF2", {
    guibg = colors.rainbow.pink,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentF3", {
    guibg = colors.rainbow.cyan,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentF4", {
    guibg = colors.rainbow.green,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentF5", {
    guibg = colors.rainbow.purple,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentF6", {
    guibg = colors.rainbow.yellow,
    gui = "nocombine",
  })
  hi("IndentBlanklineIndentF7", {
    guibg = colors.rainbow.orange,
    gui = "nocombine",
  })

  config.space_char_highlight_list = {
    "IndentBlanklineIndentF1",
    "IndentBlanklineIndentF2",
    "IndentBlanklineIndentF3",
    "IndentBlanklineIndentF4",
    "IndentBlanklineIndentF5",
    "IndentBlanklineIndentF6",
    "IndentBlanklineIndentF7",
  }
  config.char_highlight_list = {
    "IndentBlanklineIndentS1",
    "IndentBlanklineIndentS2",
    "IndentBlanklineIndentS3",
    "IndentBlanklineIndentS4",
    "IndentBlanklineIndentS5",
    "IndentBlanklineIndentS6",
    "IndentBlanklineIndentS7",
  }
end

presets.normal = function()
  hi("IndentBlanklineIndent1", { guifg = colors.shades.shade01, gui = "nocombine" })
  config.char_highlight_list = {
    "IndentBlanklineIndent1",
  }
end

presets.normal()

blankline.setup(config)

-- vim:ft=lua
