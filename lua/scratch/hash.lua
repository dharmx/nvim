local M = {}

function M.hashtags(options)
  options = vim.F.if_nil(options, {})
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local temp = vim.split(vim.fn.system({
    "rg", "--no-heading", "--trim", "-NIo", "\\s+#([\\w-]+)",
  }), "\n", { plain = true })
  table.remove(temp, #temp)
  local results = {}
  for _, item in ipairs(temp) do results[item] = true end

  pickers.new(options, {
    prompt_title = "Hashtags",
    finder = finders.new_table(vim.tbl_keys(results)),
    attach_mappings = function()
      actions.select_default:replace(function(buffer)
        actions.close(buffer)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      return true
    end,
  }):find()
end

return M
