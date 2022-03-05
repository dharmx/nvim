local M = {}

M.mappings = {
  ["name"] = " Buffers",
  ["<leader>b"] = {
    ["name"] = "﬘ Bufferline",
    ["i"] = { "<CMD>BufferLinePick<CR>", " Pick buffer" },
    ["n"] = { "<CMD>BufferLineMoveNext<CR>", " Move next" },
    ["p"] = { "<CMD>BufferLineMovePrev<CR>", " Move previous" },
    ["l"] = { "<CMD>BufferLineCloseLeft<CR>", " Close left" },
    ["r"] = { "<CMD>BufferLineCloseRight<CR>", " Close right" },
    ["x"] = { "<CMD>BufferLinePickClose<CR>", " Pick close" },
    ["X"] = { "<CMD>BufferLineGroupClose<CR>", "  Group close" },
    ["g"] = { "<CMD>BufferLineGroupToggle<CR>", " Group toggle" },
    ["s"] = {
      ["name"] = " Sort",
      ["d"] = { "<CMD>BufferLineSortByDirectory<CR>", " Directory" },
      ["t"] = { "<CMD>BufferLineSortByTabs<CR>", "ﴵ Tabs" },
      ["e"] = { "<CMD>BufferLineSortByExtension<CR>", "  Extension" },
      ["r"] = { "<CMD>BufferLineSortByRelativeDirectory<CR>", " Relative directory" },
    },
  },
  ["<Tab>"] = { "<CMD>BufferLineCycleNext<CR>", " Next" },
  ["<S-Tab>"] = { "<CMD>BufferLineCyclePrev<CR>", " Previous" },
  ["<C-t>"] = { "<CMD>tabnew<CR>", " New tab" },
  ["<C-b>"] = { "<CMD>enew<CR>", " New buffer" },
  ["<C-x>"] = { "<CMD>lua require('utils').delete_buffer()<CR>", " Delete" },
  ["<leader>B"] = {
    ["name"] = "ﴵ Tabs",
    ["h"] = { "<CMD>tablast<CR>", " Last" },
    ["l"] = { "<CMD>tabfirst<CR>", " First" },
    ["k"] = { "<CMD>tabonly<CR>", " Only" },
    ["j"] = { "<CMD>tabrewind<CR>", " Rewind" },
  },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  nowait = false,
}

return M
