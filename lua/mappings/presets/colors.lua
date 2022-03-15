local M = {}

M.mappings = {
  ["<F3>"] = { "<CMD>ColorizerToggle<CR>", "﯂ Enable colorizer" },
  ["<leader>k"] = {
    ["name"] = " Color highlights",
    ["<F1>"] = { "<CMD>ColorToggle<CR>", " Color toggle" },
    ["<F2>"] = { "<CMD>ColorClear<CR>", " Color clear" },
    ["<F3>"] = { "<CMD>ColorContrast<CR>", "﯂ Color contast" },
    ["<F4>"] = { "<CMD>ColorHighlight<CR>", " Color highlight" },
    ["<F5>"] = { "<CMD>ColorSwapFgBg<CR>", " Color swap bgfg" },
    ["<F6>"] = { "<CMD>ColorizerAttatchToBuffer<CR>", " Colorizer attatch to buffer" },
    ["<F7>"] = { "<CMD>ColorizerDetachFromBuffer<CR>", " Colorizer detatch from buffer" },
    ["<F8>"] = { "<CMD>ColorizerReloadAllBuffers<CR>", " Colorizer reload all buffers" },
  },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  nowait = false,
}

return M

-- vim:ft=lua
