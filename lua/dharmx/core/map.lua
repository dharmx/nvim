local util = require("dharmx.util").map
local nmap = util.nmap
local inmap = util.inmap

nmap("<leader>y", ":%yank+<CR>", "Copy an entire buffer.")
nmap("<C-S>", vim.cmd.update, "Write changes only if the buffer is modified.")

nmap("<leader>q", function() require("dharmx.util").close() end, "Delete buffer.")
nmap("<leader>r", require("dharmx.util").nvim.readable_numbers, "Delete buffer.")
nmap("<leader>]", vim.cmd.bnext, "Goto next buffer.")
nmap("<leader>[", vim.cmd.bprev, "Goto prev buffer.")

nmap("<leader>pp", vim.cmd.Lazy, "List all plugins.")
nmap("<C-k>", "<cmd>cnext<CR>zz", "Display next error.")
nmap("<C-j>", "<cmd>cprev<CR>zz", "Display previous error.")

nmap("<leader>ff", function() require("telescope.builtin").find_files() end, "Telescope find files.")
nmap("<leader>fg", function() require("telescope.builtin").live_grep() end, "Telescope looks for strings in a file.")
nmap("<leader>fb", function() require("telescope.builtin").buffers() end, "Telescope find buffers.")
nmap("<leader>fh", function() require("telescope.builtin").help_tags() end, "Telescope find help tags.")
nmap("<leader>hl", function() require("telescope.builtin").highlights() end, "Telescope find highlights")
nmap("<leader>mn", function() require("telescope.builtin").man_pages() end, "Telescope find man pages.")
nmap("<leader>ii", function() require("telescope").extensions.media.media() end, "Telescope view images.")
nmap("<leader>gc", function() require("telescope.builtin").git_commits() end, "Telescope find git commits.")

nmap("<C-N>", vim.cmd.RnvimrToggle, "Open RNVIMR file manager.")
nmap("<leader>uu", vim.cmd.UndotreeToggle, "Track undo items.")

inmap("<F2>", ":setlocal spell!<CR>", "Toggle spellchecker.")
inmap("<F3>", vim.cmd.ColorizerToggle, "Toggle colorizer highlights.")
inmap("<F4>", vim.cmd.SignatureToggleSigns, "Mark representation in signcolumn.")
inmap([[<C-\>]], vim.cmd.ToggleTerm, "Open floating terminal.")
inmap("<F5>", vim.cmd.BookmarkToggle, "Bookmark current line.")
