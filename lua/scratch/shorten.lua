---@diagnostic disable: param-type-mismatch
local M = {}

local util = require("dharmx.utils.nvim")
local curl = require("plenary.curl")
local ts_utils = require("nvim-treesitter.ts_utils")

function M.tree()
  local node = ts_utils.get_node_at_cursor(0)
  if node and not node:type() then return end
  local word = vim.fn.trim(vim.treesitter.query.get_node_text(node, 0), '"')
  if not word:match("^https://.+") then return end
  M.shorten(word, function(response)
    vim.fn.setreg("+", response.body)
    vim.notify("+" .. response.body)
  end)
end

function M.line()
  local line = vim.api.nvim_get_current_line()
  if not line:match("^https://.+") then return end
  M.shorten(line, function(response)
    vim.fn.setreg("+", response.body)
    vim.notify("+" .. response.body)
  end)
end

function M.dialog()
  util.popup({ size = 50 }, {
    prompt = "   ",
    default_value = "URL",
    on_submit = function(entry)
      if not entry:match("^https://.+") then return end
      M.shorten(entry, function(response)
        vim.fn.setreg("+", response.body)
        vim.notify("+" .. response.body)
      end)
    end,
  })
end

function M.shorten(link, callback)
  curl.get(string.format("https://is.gd/create.php?format=simple&url=%s", link), {
    callback = vim.schedule_wrap(callback),
    dry_run = false,
  })
end

return M
