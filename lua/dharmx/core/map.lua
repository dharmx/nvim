local util = require("dharmx.util").map
local nmap = util.nmap
local inmap = util.inmap
local nvmap = util.nvmap

nmap("<C-S>", vim.cmd.update, "Write changes only if the buffer is modified.")
nmap("<leader>Y", [["+Y]], "Copy a line with to system clipboard.")
nvmap("<leader>y", [["+y]], "Copy a line without the newline to system clipboard.")

nmap("<leader>xx", ":Telescope track track", "Show/Hide trackmenu.")
nmap("<leader>xm", ":Mark", "Add file to tracklist.")
nmap("<leader>xb", ":Telescope buffers", "Telescope find buffers.")
nmap("<leader>xz", function()
  local item = tonumber(vim.fn.nr2char(vim.fn.getchar()))
  if item then require("harpoon.ui").nav_file(item) end
end, "Move to harpoon mark X.")

nmap("<leader>q", function() require("dharmx.util").close() end, "Delete buffer.")
nmap("<leader>]", vim.cmd.bnext, "Goto next buffer.")
nmap("<leader>[", vim.cmd.bprev, "Goto prev buffer.")

nmap("<leader>pp", vim.cmd.Lazy, "List all plugins.")
nmap("<C-k>", "<cmd>cnext<CR>zz", "Display next error.")
nmap("<C-j>", "<cmd>cprev<CR>zz", "Display previous error.")

nmap("<leader>ff", ":Telescope find_files", "Telescope find files.")
nmap("<leader>fg", ":Telescope live_grep", "Telescope looks for strings in a file.")
nmap("<leader>ii", ":Telecope media media", "Telescope view images.")
nmap("<leader>gc", ":Telescope git_commits", "Telescope find git commits.")

nmap("<C-N>", vim.cmd.RnvimrToggle, "Open RNVIMR file manager.")
nmap("<leader>uu", vim.cmd.UndotreeToggle, "Track undo items.")

inmap("<F2>", function() vim.opt.spell = not vim.opt.spell:get() end, "Toggle spellchecker.")
inmap("<F3>", vim.cmd.ColorizerToggle, "Toggle colorizer highlights.")
inmap([[<C-\>]], vim.cmd.ToggleTerm, "Open floating terminal.")
