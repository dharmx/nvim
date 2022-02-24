local g = vim.g

local disabled_builtins = {
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
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor_mode_plugin",
  "fzf",
  "spellfile_plugin",
  "filetype",
  "ftoff",
  "ftplugin",
  "ftplugof",
}

for _, plugin in ipairs(disabled_builtins) do
  g["loaded_" .. plugin] = 1
end
