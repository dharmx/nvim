local M = {}
local curl = require("plenary.curl")
local Path = require("plenary.path")
local Job = require("plenary.job")

M._responses = {}
M.config = {
  db_path = vim.fn.stdpath("state") .. "/paste.db.json",
  tmp_path = "/tmp/paste.txt",
}

function M.setup(options)
  options = vim.F.if_nil(options, {})
  M.config = vim.tbl_deep_extend("keep", options, M.config)
  M._db = Path:new(M.config.db_path)
  M._responses = {}
  if M._db:exists() then
    M._responses = vim.json.decode(M._db:read())
  end
end

function M.delete(response)
  local token
  for _, header in ipairs(response.headers) do
    if header:match("^x%-token: ") then token = header end
  end
  Job:new({
    command = "curl",
    args = {
      "-Ftoken=" .. vim.split(token, ": ", { plain = true })[2],
      "-Fdelete= ",
      response.body,
    },
    on_exit = vim.schedule_wrap(function(self, code, _)
      if code ~= 0 then
        vim.api.nvim_notify(vim.inspect(self:stderr_result()), vim.log.levels.INFO, { title = "pastebin", icon = " " })
        return
      end
      vim.api.nvim_notify(vim.inspect(self:result()), vim.log.levels.INFO, { title = "pastebin", icon = " " })
      M._responses[response.body] = nil
      M._db:write(vim.json.encode(M._responses), "w")
    end),
  }):start()
end

function M.paste(name, contents)
  if name == "" then name = M.config.tmp_path else name = string.format("/tmp/%s", name) end
  local path = Path:new(name)
  path:touch()
  path:write(table.concat(contents, "\n"), "w")
  P(curl.post("https://0x0.st", {
    dry_run = true,
    form = { file = string.format("@%s", path.filename) },
    callback = function(response)
      M._responses[response.body] = response
      path:rm()
      vim.schedule(function()
        vim.fn.setreg("+", response.body)
        vim.api.nvim_notify("+pastebin: " .. response.body, vim.log.levels.INFO, { title = "pastebin", icon = " " })
        M._db:write(vim.json.encode(M._responses), "w")
      end)
    end,
  }))
end

function M.command(args)
  args.line1 = (args.range == 2 and args.line1 or 1) - 1
  args.line2 = args.range == 2 and args.line2 or -1
  local contents = vim.api.nvim_buf_get_lines(0, args.line1, args.line2, false)
  M.paste(vim.fs.basename(vim.api.nvim_buf_get_name(0)), contents)
end

return M
