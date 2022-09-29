local M = {}

function M.goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log").info

  return function(_, result, context)
    if result == nil or vim.tbl_isempty(result) then
      _ = log() and log(context.method, "No location found")
      return
    end

    if split_cmd then
      cmd(split_cmd)
    end
    if vim.tbl_islist(result) then
      util.jump_to_location(result[1], "utf8")
      if #result > 1 then
        util.set_qflist(util.locations_to_items(result, "utf8"))
        cmd("copen")
        cmd("wincmd p")
      end
    else
      util.jump_to_location(result, "utf8")
    end
  end
end

return M

-- vim:ft=lua
