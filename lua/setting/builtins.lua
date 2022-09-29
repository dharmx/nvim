--- Do not load some builtin plugins for increasing performance.
--- you can load those plugins by using :runtime <plug-name>
--- also don't forget to reset the vim.g.loaded_<plug-name> to 0 first

-- disabled native vim plugins in order to make startup time faster.
for builtin, status in pairs({
  ["2html_plugin"] = 1,
  ["getscript"] = 1,
  ["getscriptPlugin"] = 1,
  ["gzip"] = 1,
  ["logipat"] = 1,
  ["netrwPlugin"] = 1,
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
}) do
  vim.g["loaded_" .. builtin] = status
end

-- vim:ft=lua
