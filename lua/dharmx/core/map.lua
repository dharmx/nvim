local util = require("dharmx.util.map")
local nmap = util.nmap
local vmap = util.vmap
local xmap = util.xmap
local nnmap = util.nnmap

nmap("<leader>y", ":%yank+<CR>", "Copy an entire buffer.")
nmap("<C-N>", vim.cmd.RnvimrToggle, "Open RNVIMR file manager.")
nmap("<F3>", vim.cmd.ColorizerToggle, "Toggle colorizer highlights.")
nmap("<F2>", ":setlocal spell!<CR>", "Toggle spellchecker.")
nmap("<C-S>", vim.cmd.update, "Write changes only if the buffer is modified.")

nmap("<leader>q", function() require("dharmx.util.close")() end, "Delete buffer.")
nmap("<leader>n", vim.cmd.tabnew, "Make new tab.")
nmap("<leader>]", vim.cmd.bnext, "Goto next buffer.")
nmap("<leader>[", vim.cmd.bprev, "Goto prev buffer.")
nmap("<leader>;", vim.cmd.tabnext, "Goto prev tab.")
nmap("<leader>'", vim.cmd.tabprev, "Goto prev tab.")

nmap("<leader>pp", vim.cmd.Lazy, "List all plugins.")
nmap("<C-k>", "<cmd>cnext<CR>zz", "Display next error.")
nmap("<C-j>", "<cmd>cprev<CR>zz", "Display previous error.")

nmap([[<C-\>]], vim.cmd.ToggleTerm, "Open floating terminal.")
nnmap("<leader>e", vim.diagnostic.open_float, "View diagnostic messages in a floating window.")
nnmap("[d", vim.diagnostic.goto_prev, "Move to previous diagnostic position.")
nnmap("]d", vim.diagnostic.goto_next, "Move to next diagnostic position.")
nnmap("<leader>d", vim.diagnostic.setloclist, "Set location listof the diagnostic messages.")

nmap("<leader>ff", function() require("telescope.builtin").find_files() end, "Telescope find files.")
nmap("<leader>fg", function() require("telescope.builtin").live_grep() end, "Telescope looks for strings in a file.")
nmap("<leader>fb", function() require("telescope.builtin").buffers() end, "Telescope find buffers.")
nmap("<leader>fh", function() require("telescope.builtin").help_tags() end, "Telescope find help tags.")
nmap("<leader>hl", function() require("telescope.builtin").highlights() end, "Telescope find highlights")
nmap("<leader>mn", function() require("telescope.builtin").man_pages() end, "Telescope find man pages.")
nmap("<leader>ii", function() require("telescope").extensions.media.media() end, "Telescope view images.")
nmap("<leader>gc", function() require("telescope.builtin").git_commits() end, "Telescope find git commits.")

-- vim:filetype=lua
