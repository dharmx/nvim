local M = {}

M.autocmds = {
  ["yank_feedback"] = true,
  ["term_non_relative"] = true,
  ["filetype_format"] = true,
  ["block_read_only"] = true,
  ["plugins_auto_source"] = true,
  ["nvimrc_auto_source"] = true,
}

M.options = {
  ["normal"] = {
    ["laststatus"] = 0,
    ["ttyfast"] = true,
    ["undolevels"] = 5000,
    ["number"] = false,
    ["numberwidth"] = 1,
    ["wrap"] = false,
    ["pumheight"] = 25,
    ["history"] = 5000,
  },
  ["append"] = {
    ["shortmess"] = "casI",
  },
}

local file_name = "_compiled"
M.compiled = {
  ["file_name"] = file_name,
  ["full_path"] = vim.fn.stdpath "config" .. "/lua/configs/core/" .. file_name .. ".lua",
  ["impatient"] = "configs.core." .. file_name,
}

M.theme = { ["colorscheme"] = "nordic", ["background"] = "dark" }

M.miscmds = {
  ["ease_quit"] = true,
}

M.builtins = {
  ["spellfile_plugin"] = false,
}

M.plugins = {
  ["completion"] = {
    ["cmp-treesitter"] = false,
    ["cmp-nvim-lsp-document-symbol"] = false,
    ["cmp-nvim-lsp-signature-help"] = false,
  },
  ["editing"] = {
    ["rasi.vim"] = true,
    ["yuck.vim"] = true,
    ["sxhkd-vim"] = true,
    ["vim-log-highlighting"] = true,
    ["vim-polyglot"] = true,
    ["neogit"] = true,
    ["todo-comments.nvim"] = true,
    ["trouble.nvim"] = true,
    ["markdown-preview.nvim"] = true,
  },
  ["workflow"] = {
    ["nvim-neoclip.lua"] = true,
    ["telescope-dict.nvim"] = true,
    ["telescope-command-palette.nvim"] = true,
    ["telescope-node-modules.nvim"] = true,
    ["telescope-luasnip.nvim"] = true,
    ["telescope-emoji.nvim"] = true,
    ["telescope-heading.nvim"] = true,
    ["telescope-bookmarks.nvim"] = true,
    ["telescope-frecency.nvim"] = true,
    ["telescope-tele-tabby.nvim"] = true,
    ["telescope-repo.nvim"] = true,
    ["telescope-media-files.nvim"] = true,
    ["telescope-project.nvim"] = true,
    ["telescope-packer.nvim"] = true,
    ["telescope-file-browser.nvim"] = true,
  },
  ["utils"] = {
    ["nvim-notify"] = true,
  },
}

return M

-- vim:ft=lua
