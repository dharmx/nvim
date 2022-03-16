local M = {}

M.mappings = {
  ["name"] = " Packer",
  ["s"] = { "<CMD>PackerSync<CR>", "מּ Sync" },
  ["u"] = { "<CMD>PackerUpdate<CR>", "ﮮ Update" },
  ["i"] = { "<CMD>PackerInstall<CR>", " Install" },
  ["c"] = { "<CMD>PackerClean<CR>", " Clean" },
  ["p"] = { "<CMD>PackerStatus<CR>", " Status" },
  ["r"] = { "<CMD>PackerCompile<CR>", " Compile" },
  ["f"] = { "<CMD>PackerProfile<CR>", " Profile" },
}

M.options = {
  mode = "n",
  prefix = "<leader>p",
  silent = true,
  noremap = true,
  nowait = false,
}

return M

-- vim:ft=lua
