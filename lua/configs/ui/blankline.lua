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
    foreground = colors.shades.shade06,
    background = colors.shades.shade06,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndent2", {
    foreground = colors.common.base00,
    background = colors.common.base00,
    decoration = "nocombine",
  })

  hi("IndentBlanklineIndent3", {
    background = colors.shades.shade06,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndent4", {
    background = colors.common.base00,
    decoration = "nocombine",
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
  hi("IndentBlanklineIndent1", { foreground = colors.rainbow.pink, decoration = "nocombine" })
  hi("IndentBlanklineIndent2", { foreground = colors.rainbow.cyan, decoration = "nocombine" })
  hi("IndentBlanklineIndent3", { foreground = colors.rainbow.green, decoration = "nocombine" })
  hi("IndentBlanklineIndent4", { foreground = colors.rainbow.purple, decoration = "nocombine" })
  hi("IndentBlanklineIndent5", { foreground = colors.rainbow.cobalt, decoration = "nocombine" })
  hi("IndentBlanklineIndent6", { foreground = colors.rainbow.yellow, decoration = "nocombine" })
  hi("IndentBlanklineIndent7", { foreground = colors.rainbow.orange, decoration = "nocombine" })

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
    foreground = colors.rainbow.cobalt,
    background = colors.rainbow.cobalt,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentS2", {
    foreground = colors.rainbow.pink,
    background = colors.rainbow.pink,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentS3", {
    foreground = colors.rainbow.cyan,
    background = colors.rainbow.cyan,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentS4", {
    foreground = colors.rainbow.green,
    background = colors.rainbow.green,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentS5", {
    foreground = colors.rainbow.purple,
    background = colors.rainbow.purple,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentS6", {
    foreground = colors.rainbow.yellow,
    background = colors.rainbow.yellow,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentS7", {
    foreground = colors.rainbow.orange,
    background = colors.rainbow.orange,
    decoration = "nocombine",
  })

  hi("IndentBlanklineIndentF1", {
    background = colors.rainbow.cobalt,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentF2", {
    background = colors.rainbow.pink,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentF3", {
    background = colors.rainbow.cyan,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentF4", {
    background = colors.rainbow.green,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentF5", {
    background = colors.rainbow.purple,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentF6", {
    background = colors.rainbow.yellow,
    decoration = "nocombine",
  })
  hi("IndentBlanklineIndentF7", {
    background = colors.rainbow.orange,
    decoration = "nocombine",
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
  hi("IndentBlanklineIndent1", { foreground = colors.shades.shade01, decoration = "nocombine" })
  config.char_highlight_list = {
    "IndentBlanklineIndent1",
  }
end

presets.normal()

blankline.setup(config)

-- vim:ft=lua
