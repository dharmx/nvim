local present, presence = pcall(require, "presence")

if not present then
  return
end

local config = {
  auto_update = true,
  neovim_image_text = "Keymaster's Forgery",
  main_image = "file",
  debounce_timeout = 30,
  enable_line_number = true,
  blacklist = {},
  buttons = true,
  editing_text = "Forging %s",
  file_explorer_text = "Browsing %s",
  git_commit_text = "Delivering Orders",
  plugin_manager_text = "Repairing Forgery",
  reading_text = "Mastering %s",
  workspace_text = "Conjuring %s",
  line_number_text = "Verse %s out of %s",
  file_assets = require "tables.presence",
}

presence:setup(config)

-- vim:ft=lua:nowrap
