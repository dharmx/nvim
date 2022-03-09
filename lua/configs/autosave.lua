local present, autosave = pcall(require, "autosave")

if not present then
  return
end

local config = {
  enabled = false,
  execution_message = "AutoSave: saved at " .. vim.fn.strftime "%H:%M:%S",
  events = { "InsertLeave", "TextChanged" },
  conditions = {
    exists = true,
    filename_is_not = {},
    filetype_is_not = {},
    modifiable = true,
  },
  write_all_buffers = false,
  on_off_commands = true,
  clean_command_line_interval = 0,
  debounce_delay = 135,
}

autosave.setup(config)

-- vim:ft=lua
