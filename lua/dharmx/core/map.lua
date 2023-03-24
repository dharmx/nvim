local util = require("dharmx.util").map
local nmap = util.nmap
local inmap = util.inmap
local nvmap = util.nvmap

nmap("<C-S>", "<CMD>update<CR>", "Write changes only if the buffer is modified.")
nmap("<leader>Y", [["+Y]], "Copy a line with to system clipboard.")
nvmap("<leader>y", [["+y]], "Copy a line without the newline to system clipboard.")

nmap("<leader>xx", "<CMD>Track<CR>", { desc = "Show/Hide trackmenu.", silent = true })
nmap("<leader>xm", "<CMD>MarkFile<CR>", { desc = "Add file to tracklist.", silent = true })
nmap("<leader>xu", "<CMD>UnmarkFile<CR>", { desc = "Remove file from tracklist.", silent = true })
nmap("<leader>bb", "<CMD>Telescope buffers<CR>", "Telescope find buffers.")
nmap("<leader>ii", "<CMD>lua require'telescope'.extensions.media.media()<CR>", "Telescope view images.")

nmap("<leader>q", "<CMD>lua require'dharmx.util'.close()<CR>", "Delete buffer.")
nmap("<leader>]", "<CMD>bnext<CR>", "Goto next buffer.")
nmap("<leader>[", "<CMD>bprev<CR>", "Goto prev buffer.")

nmap("<leader>pp", "<CMD>Lazy<CR>", "List all plugins.")
nmap("<C-k>", "<CMD>cnext<CR>zz", "Display next error.")
nmap("<C-j>", "<CMD>cprev<CR>zz", "Display previous error.")

nmap("<leader>ff", "<CMD>Telescope find_files<CR>", "Telescope find files.")
nmap("<leader>fg", "<CMD>Telescope live_grep<CR>", "Telescope looks for strings in a file.")
nmap("<leader>gc", "<CMD>Telescope git_commits<CR>", "Telescope find git commits.")

nmap("<C-N>", "<CMD>RnvimrToggle<CR>", "Open RNVIMR file manager.")
nmap("<leader>uu", "<CMD>UndotreeToggle<CR>", "Track undo items.")

inmap("<F2>", "<CMD>set spell!<CR>", "Toggle spellchecker.")
inmap("<F3>", "<CMD>ColorizerToggle<CR>", "Toggle colorizer highlights.")
inmap([[<C-\>]], "<CMD>ToggleTerm<CR>", "Open floating terminal.")
