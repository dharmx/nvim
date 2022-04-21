--- Do not load some builtin plugins for increasing performance.
-- @module settings.builtins

-- disabled native vim plugins in order to make startup time faster.
for builtin, status in pairs {
  ["2html_plugin"] = 1,
  ["getscript"] = 1,
  ["getscriptPlugin"] = 1,
  ["gzip"] = 1,
  ["logipat"] = 1,
  ["netrw"] = 1,
  ["netrwPlugin"] = 1,
  ["netrwSettings"] = 1,
  ["netrwFileHandlers"] = 1,
  ["tar"] = 1,
  ["tarPlugin"] = 1,
  ["rrhelper"] = 1,
  ["vimball"] = 1,
  ["vimballPlugin"] = 1,
  ["zip"] = 1,
  ["zipPlugin"] = 1,
  ["tutor_mode_plugin"] = 1,
  ["fzf"] = 1,
  ["spellfile_plugin"] = 1,
  ["sleuth"] = 1,
} do
  g["loaded_" .. builtin] = status
end

-- vim:ft=lua
