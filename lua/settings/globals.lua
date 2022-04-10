--- Set up vim global variables.
-- @module settings.globals

local M = {}

M["mapleader"] = " " -- trigger for mappings
M["python3_host_prog"] = "python3" -- command to start python3 (executable, not directory)

-- for now, Lua filetype detection is opt-in
M["do_filetype_lua"] = 1

-- if this variable exists, $VIMRUNTIME/filetype.vim will not run
M["did_load_filetypes"] = 0

return M

-- vim:ft=lua
