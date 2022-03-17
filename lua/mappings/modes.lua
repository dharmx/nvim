local M = {}

M.mappings = {
  ["M"] = {
    ["name"] = "ﯯ Mode replacements",
    ["s"] = { "<CMD>SearchBoxSimple<CR>", " Find" },
    ["r"] = { "<CMD>SearchBoxReplace<CR>", "﯒ Find and replace" },
    ["l"] = { "<CMD>SearchBoxClear<CR>", " Clear highlights" },
    ["m"] = { "<CMD>SearchBoxMatchAll<CR>", " Find all" },
    ["i"] = { "<CMD>SearchBoxIncSearch<CR>", " Insert search" },
    ["c"] = { "<CMD>FineCmdline<CR>", " Cmdline" },
    ["S"] = { "<CMD>lua mappings.cmdline_override()<CR>", " Use NUI cmdline backend" },
    ["C"] = { "<CMD>lua mappings.search_override()<CR>", " Use NUI search backend" },
  },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  prefix = "<leader>",
  nowait = false,
}

return M

-- vim:ft=lua
