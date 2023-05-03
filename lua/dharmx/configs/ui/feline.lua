local ok, feline = pcall(require, "feline")
if not ok then return end

local options = require("colo.extensions.feline")
local left = {}
local center = {}
local right = {
  options.component.vim_mode,
  options.component.file_type,
  options.component.lsp,
  options.component.git_branch,
  options.component.git_add,
  options.component.git_delete,
  options.component.git_change,
  options.component.separator,
  options.component.diagnostic_errors,
  options.component.diagnostic_warnings,
  options.component.diagnostic_info,
  options.component.diagnostic_hints,
  options.component.search_count,
  options.component.scroll_bar,
}

feline.setup({
  components = {
    active = {
      left,
      center,
      right,
    },
  },
  theme = options.theme,
  vi_mode_colors = options.colors,
})
