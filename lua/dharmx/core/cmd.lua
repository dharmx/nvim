-- stylua: ignore start
local util = require("dharmx.util").nvim
local cmd = util.cmd

cmd("PeekOpen", function() require("peek").open() end, { desc = "Open peek window." })
cmd("PeekClose", function() require("peek").close() end, { desc = "Close peek window." })
cmd("SyntaxIDUnderCursor", ":echo synIDattr(synID(line('.'), col('.'), 1), 'name')", { desc = "synIDattr under cursor." })

cmd("Sabotage", function(args)
  local option = args.args
  if vim.tbl_contains({ "live_grep", "grep_string", "find_files" }, option) then
    local state = require("telescope.actions.state")
    require("telescope.builtin")[option]({
      attach_mappings = function(buffer, map)
        map({ "i", "n" }, "<CR>", function()
          local path = vim.split(state.get_selected_entry().value, ":", { plain = true })[1]
          require("telescope.actions").close(buffer)
          vim.cmd.edit(path)
          vim.cmd.chdir(vim.fn.fnamemodify(path, ":h"))
        end)
        return true
      end,
    })
    return
  end
  vim.api.nvim_notify("Choose among these options: live_grep/grep_string/find_files", vim.log.levels.WARN, {
    title = "Sabotage!",
    icon = " ",
  })
end, { nargs = 1, desc = "Change CWD.", complete = function() return { "live_grep", "grep_string", "find_files" } end })

cmd("LineWidthColumn", function()
  if vim.wo.colorcolumn == "0" then
    vim.wo.colorcolumn = vim.bo.textwidth .. ""
  else
    vim.wo.colorcolumn = "0"
  end
end, "Virtual column for measuring text line length.")

-- cmd("HugoServer", function()
--   if _G.HUGO_JOBS then
--     local SIGKILL = 9
--     ---@diagnostic disable-next-line: deprecated
--     table.foreachi(_G.HUGO_JOBS, function(_, job) vim.loop.kill(job.pid, SIGKILL) end)
--     _G.HUGO_JOBS = nil
--     return
--   end

--   local Job = require("plenary.job")
--   local path = vim.fn.bufname()
--   if vim.fn.fnamemodify(path, ":t") == "config.toml" then
--     local hugo = Job:new({
--       "hugo",
--       "server",
--       cwd = vim.fn.fnamemodify(path, ":h"),
--     })
--     hugo:start()
--     _G.HUGO_JOBS = _G.HUGO_JOBS and table.insert(_G.HUGO_JOBS, hugo) or { hugo }
--   end
-- end, "Launch/Stop Hugo live server.")
