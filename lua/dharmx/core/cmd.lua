-- stylua: ignore start
local util = require("dharmx.util").nvim
local cmd = util.cmd

vim.api.nvim_create_user_command("Paste", function(args)
  local curl = require("plenary.curl")
  local Path = require("plenary.path")
  args.line1 = (args.range == 2 and args.line1 or 1) - 1
  args.line2 = args.range == 2 and args.line2 or -1

  local contents = vim.api.nvim_buf_get_lines(0, args.line1, args.line2, false)
  local file = vim.fs.basename(vim.api.nvim_buf_get_name(0))
  if file == "" then file = "/tmp/paste.txt"
  else file = string.format("/tmp/%s", file) end

  local path = Path:new(file)
  path:touch()
  path:write(table.concat(contents, "\n"), "w")

  curl.post("https://0x0.st", {
    form = { file = string.format("@%s", path.filename) },
    dry_run = false,
    callback = function(response)
      path:rm()
      vim.schedule(function()
        vim.fn.setreg("+", response.body)
        vim.api.nvim_notify("+pastebin: " .. response.body, vim.log.levels.INFO, { title = "pastebin", icon = " " })
      end)
    end,
  })
end, { desc = "Create a new pastebin link. Powered by 0x0.st.", range = true })

cmd("SyntaxIDUnderCursor", ":echo synIDattr(synID(line('.'), col('.'), 1), 'name')", "synIDattr under cursor.")
cmd("LineWidthColumn", function()
  if vim.wo.colorcolumn == "0" then
    vim.wo.colorcolumn = vim.bo.textwidth .. ""
    return
  end
  vim.wo.colorcolumn = "0"
end, "Virtual column for measuring text line length.")
