--- Theming related utility functions
-- @module utils.theming
-- @alias M

local M = {}

--- Returns the current theme colors.
-- @return table of highlight groups and their color values
function M.get_active_scheme()
  return require("theming.schemes." .. colorscheme)
end

--- Applies highlight to a group. Creates the group if it doesn't exists.
-- @see help highlight-{guifg,guibg,gui,guisp,link,args,groups}
function M.highlight(group, colors)
  if colors.link then
    vim.highlight.link(group, colors.link, true)
    return
  end
  colors = vim.tbl_extend("keep", colors, { guifg = "NONE", guibg = "NONE" })
  vim.highlight.create(group, colors)
end

--- Main function for setting up the highlights.
function M.apply(colors)
  require("theming.groups.custom").setup(colors)
  require("theming.groups.statusline").setup(colors)
  require("theming.groups.terminal").setup(colors)
  require("theming.groups.ui").setup(colors)

  require("theming.groups.syntax.general").setup(colors)
  require("theming.groups.syntax.html").setup(colors)
  require("theming.groups.syntax.lua").setup(colors)
  require("theming.groups.syntax.markdown").setup(colors)

  require("theming.groups.plugins.alpha").setup(colors)
  require("theming.groups.plugins.blankline").setup(colors)
  require("theming.groups.plugins.bookmarks").setup(colors)
  require("theming.groups.plugins.bufferline").setup(colors)
  require("theming.groups.plugins.cmp").setup(colors)
  require("theming.groups.plugins.diff").setup(colors)
  require("theming.groups.plugins.todo").setup(colors)
  require("theming.groups.plugins.trouble").setup(colors)
  require("theming.groups.plugins.whichkey").setup(colors)
  require("theming.groups.plugins.treesitter").setup(colors)
  require("theming.groups.plugins.telescope").setup(colors)
  require("theming.groups.plugins.rnvimr").setup(colors)
  require("theming.groups.plugins.rainbow").setup(colors)
  require("theming.groups.plugins.packer").setup(colors)
  require("theming.groups.plugins.outline").setup(colors)
  require("theming.groups.plugins.nvimtree").setup(colors)
  require("theming.groups.plugins.notify").setup(colors)
  require("theming.groups.plugins.neogit").setup(colors)
  require("theming.groups.plugins.lsp").setup(colors)
  require("theming.groups.plugins.lightbulb").setup(colors)
  require("theming.groups.plugins.hop").setup(colors)
  require("theming.groups.plugins.gitsigns").setup(colors)
end

function M.prepare_plugin(plugin)
  return require("theming.groups.plugins." .. plugin)
end

function M.prepare_syntax(language)
  return require("theming.groups.syntax." .. language)
end

return M

-- vim:ft=lua
