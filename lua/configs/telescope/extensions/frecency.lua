local workspaces = {
  ["config"] = "/home/maker/.config",
  ["project"] = "/home/maker/Dotfiles",
}

local database_path = vim.fn.stdpath "data" .. "/databases"

return {
  db_root = database_path,
  show_scores = false,
  show_unindexed = true,
  ignore_patterns = { "*.git/*", "*/tmp/*" },
  disable_devicons = false,
  workspaces = workspaces,
}

-- vim:ft=lua
