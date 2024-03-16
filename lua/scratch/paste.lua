local M = {}
local Path = require("plenary.path")
local Job = require("plenary.job")

M.config = {
  db_path = vim.fn.stdpath("state") .. "/paste.db.json",
  tmp_path = "/tmp/paste",
  dump_path = "/tmp/dump",
}

function M.setup(options)
  options = vim.F.if_nil(options, {})
  M.config = vim.tbl_deep_extend("keep", options, M.config)
  M._db = Path:new(M.config.db_path)
  M._dump = Path:new(M.config.dump_path)
  M._path = Path:new(M.config.tmp_path)
  M._responses = {}
  if M._db:exists() then M._responses = vim.json.decode(M._db:read()) end
end

function M.paste(contents)
  M._path:write(table.concat(contents, "\n"), "w")
  Job:new({
    command = "0x0",
    args = { "--upload", M._path.filename },
    on_exit = vim.schedule_wrap(function(self, code, _)
      if code ~= 0 then return end
      local body = self:result()[1]
      local pretty = M.pretty(M._dump:read())
      M._responses[body] = { body = body, headers = pretty.headers, code = pretty.code }
      M._path:rm()
      M._dump:rm()
      vim.fn.setreg("+", body)
      vim.api.nvim_notify(body, vim.log.levels.INFO, { title = "0x0", icon = " " })
      M._db:write(vim.json.encode(M._responses), "w")
    end),
  }):start()
end

function M.delete(response)
  if not response then return end
  if not response.headers["x-token"] then
    M._responses[response.body] = nil
    M._db:write(vim.json.encode(M._responses), "w")
    return
  end
  Job:new({
    command = "0x0",
    args = { "--delete", response.headers["x-token"], response.body },
    on_exit = vim.schedule_wrap(function(self, code, _)
      if code ~= 0 then return end
      vim.api.nvim_notify(vim.inspect(self:result()), vim.log.levels.INFO, { title = "0x0", icon = " " })
      M._responses[response.body] = nil
      M._db:write(vim.json.encode(M._responses), "w")
    end),
  }):start()
end

function M.pretty(data)
  local lines = vim.split(data, "\r\n", { plain = true })
  local headers = {}
  local heading = vim.split(lines[1], " ", { plain = true })
  local code = heading[2]
  table.remove(lines, 1)
  for _, line in ipairs(lines) do
    local _line = vim.split(line, ": ", { plain = true })
    if #_line > 1 then
      local _colon_items = vim.split(_line[2], "; ", { plain = true })
      if #_colon_items == 1 then
        headers[_line[1]] = _colon_items[1]
      elseif #_colon_items > 1 then
        headers[_line[1]] = _colon_items
      end
    end
  end
  return { code = code, headers = headers }
end

function M.command(args)
  if args.bang and args.fargs[1] then
    M.delete(M._responses[args.fargs[1]])
  elseif args.fargs[1] then
    M.paste(vim.fn.readfile(args.fargs[1]))
  else
    args.line1 = (args.range == 2 and args.line1 or 1) - 1
    args.line2 = args.range == 2 and args.line2 or -1
    M.paste(vim.api.nvim_buf_get_lines(0, args.line1, args.line2, false))
  end
end

return M
