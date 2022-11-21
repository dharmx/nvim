local present, sidebar = pcall(require, "sidebar-nvim")

if not present then
  return
end

sidebar.setup({
  disable_default_keybindings = 0,
  bindings = nil,
  open = true,
  side = "left",
  initial_width = 30,
  hide_statusline = false,
  update_interval = 1000,
  sections = { "datetime", "git", "diagnostics" },
  section_separator = { "", "", "" },
  section_title_separator = { "" },
  containers = {
    attach_shell = "/bin/sh",
    show_all = true,
    interval = 5000,
  },
  datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
  todos = {
    icon = "",
    ignored_paths = {'~'}, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
    initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
  },
})

-- vim:filetype=lua
