vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

local saved_channel
vim.api.nvim_create_user_command("DevHelp", function(args)
  if saved_channel then
    vim.fn.jobstop(saved_channel)
    saved_channel = nil
  end

  local keyword = vim.tbl_isempty(args.fargs) and vim.fn.expand("<cword>") or args.fargs[1]
  local channel = vim.fn.jobstart({ "devhelp", "--search=" .. keyword })
  if channel == -1 then
    vim.notify("devhelp is not executable.")
  elseif channel == 0 then
    vim.notify("Invalid number of arguments.")
  else
    saved_channel = channel
  end
end, {
  nargs = 1,
  desc = ":Man equivalent for GTK/Gnome libraries."
})
