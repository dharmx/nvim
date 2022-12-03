--- Do not load some builtin plugins for increasing performance.
--- you can load those plugins by using :runtime <plug-name>
--- also don't forget to reset the vim.g.loaded_<plug-name> to 0 first

-- disabled native vim plugins in order to make startup time faster.
for _, builtin in ipairs({
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
  "tutor_mode_plugin",
  "fzf",
  "sleuth",
}) do
  vim.g["loaded_" .. builtin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- vim:ft=lua
