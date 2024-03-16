local set = vim.keymap.set
local silent = { remap = false, silent = true }
local remap = { remap = false }

set("n", "<leader>q", "<cmd>copen<cr>")
set("v", "<", "<gv", remap)
set("v", ">", ">gv", remap)
set("n", "<C-[>", "<cmd>nohlsearch<cr>", silent)
set("n", "<leader>c", "<cmd>lua require('scratch.close')()<cr>", silent)

set("n", "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])
set("v", "<leader>Y", [["+Y]])
set("v", "<leader>y", [["+y]])
set("v", "<leader>#", "<cmd>g/<C-R><C-W>/#<cr>")

set("n", "<C-H>", "<C-W>h")
set("n", "<C-J>", "<C-W>j")
set("n", "<C-K>", "<C-W>k")
set("n", "<C-L>", "<C-W>l")

set("n", "<leader><leader>", "<cmd>Track<cr>", silent)
set("n", "<leader>aa", "<cmd>Mark<cr>", silent)
set("n", "<leader>dd", "<cmd>Unmark<cr>", silent)

set("n", "<F1>", "<cmd>ColorizerToggle<cr>", remap)
set("n", "<F2>", "<cmd>setlocal spell!<cr>", remap)
set("n", "<F3>", "<cmd>make<cr>", remap)

set("n", "<C-S>", "<cmd>update<cr>", remap)
set("n", "<C-N>", "<cmd>RnvimrToggle<cr>", remap)
set("n", "<C-\\>", "<cmd>ToggleTerm<cr>", remap)

set("n", "[q", "<cmdcprevious<cr>", remap)
set("n", "]q", "<cmd>cnext<cr>", remap)
set("n", "[Q", "<cmd>cfirst<cr>", remap)
set("n", "]Q", "<cmd>clast<cr>", remap)
set("n", "[l", "<cmd>lprevious<cr>", remap)
set("n", "]l", "<cmd>lnext<cr>", remap)
set("n", "[b", "<cmd>bprevious<cr>", remap)
set("n", "]b", "<cmd>bnext<cr>", remap)
set("n", "[a", "<cmd>previous<cr>", remap)
set("n", "]a", "<cmd>next<cr>", remap)

set("n", "<C-Up>", "<cmd>resize -2<cr>", silent)
set("n", "<C-Down>", "<cmd>resize +2<cr>", silent)
set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", silent)
set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", silent)

set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", silent)
set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", silent)
set("n", "<leader>ff", "<cmd>Telescope media<cr>", silent)
set("n", "<leader>gg", "<cmd>Telescope live_grep<cr>", silent)
set("n", "<leader>mm", "<cmd>Telescope marks<cr>", silent)

set("n", "<A-k>", "<cmd>MoveLine(-1)<cr>", silent)
set("n", "<A-j>", "<cmd>MoveLine(1)<cr>", silent)
set("n", "<A-l>", "<cmd>MoveHChar(1)<cr>", silent)
set("n", "<A-h>", "<cmd>MoveHChar(-1)<cr>", silent)
set("n", "<leader>wf", "<cmd>MoveWord(1)<cr>", silent)
set("n", "<leader>wb", "<cmd>MoveWord(-1)<cr>", silent)

set("v", "<A-j>", "<cmd>MoveBlock(1)<cr>", silent)
set("v", "<A-k>", "<cmd>MoveBlock(-1)<cr>", silent)
set("v", "<A-l>", "<cmd>MoveHBlock(1)<cr>", silent)
set("v", "<A-h>", "<cmd>MoveHBlock(-1)<cr>", silent)

set("n", "<leader>s", "mm$F r<cr>`m")
set("c", "%%", "getcmdtype() == ':' ? expand('%:h') .. '/' : '%%'", { expr = true })

set("n", "<space>e", vim.diagnostic.open_float)
set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)
set("n", "<space>q", vim.diagnostic.setloclist)
