local present, telescope = pcall(require, "telescope")
if not present then
  vim.notify("Requires telescope.nvim.")
  return
end

return telescope.register_extension({
  setup = require("telescope._extensions.all_commands.engine").setup,
  exports = {
    all_commands = require("telescope._extensions.all_commands.engine").picker,
  },
})
