local M = {}

function M.pick_colors()
  local Task = require("plenary.job")
  Task:new({
    "xcolor",
    on_exit = vim.schedule_wrap(function(self, code, _)
      if code ~= 0 then
        vim.notify("Could not run xcolor.")
        return
      end
      local result = self:result()
      vim.notify("Copied " .. result[1] .. " into +.")
      vim.fn.setreg("+", result)
    end)
  }):start()
end

function M.paste(args)
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
end

function M.column()
  if vim.wo.colorcolumn == "0" then
    vim.wo.colorcolumn = vim.bo.textwidth .. ""
    return
  end
  vim.wo.colorcolumn = "0"
end

function M.auto_mkdirs()
  local directory = vim.fn.expand('<afile>:p:h')
  if directory:find('%l+://') == 1 then return end
  if vim.fn.isdirectory(directory) == 0 then vim.fn.mkdir(directory, 'p') end
end

return M
