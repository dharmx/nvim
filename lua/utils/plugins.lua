local M = {}

function M.alpha_vimenter()
  if api.nvim_buf_get_name(0) == "" then
    api.nvim_notify(
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀  ⢀⠠⠀⠀⠀⠉⠈⠁⠀⠂⠠⠀⣴⣾⣿⣦⡀⠀⠀
⠀⠀⠀⠀⠀  ⠂⠁⢀⣠⣴⣶⣶⣶⣶⣶⣤⣀⠘⣿⣿⣿⣿⠃⠀   
⠀⠀⠀  ⡀⠁⢀⣴⣿⣿⣿⣿⣿⣿⡿⠋⠉⠙⢷⣌⠉⠉⡁⠀⠀      ﳁ                    ⠀⠀⠀
⠀⠀  ⠠⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⡅⠀⠀⠀⢸⣿⣆⠀⠀⡀⠀   Welcome to KrakenVim.        
⠀⠀  ⠆⠀⢸⣿⣿⢹⣿⣿⣿⣿⣿⣿⣦⣤⣴⣿⣿⣿⠀⠀⠆⠀   Press SPC to get started.    
⠀⠀  ⠃⠀⢸⣿⣿⢸⣿⣿⣿⢸⣿⢸⣯⡴⠶⢹⣿⣿⠀⠀⠆⠀
⠀⠀  ⠐⠀⠀⢻⣿⣘⣛⣛⣿⣘⣟⣸⣇⣺⣛⣸⣿⠇⠀⠐⠀⠀                Powered By  Lua
⠀⠀  ⠀⠡⡀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠁⠀⡠⠁⠀⠀                             
⠀⠀⠀  ⠀⠀⠂⡀⠀⠉⠛⠻⠿⠿⠿⠛⠋⠁⠀⡀⠂⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀  ⠀⠀⠐⠂⠤⠀⢀⢀⠀⠠⠄⠒
    ]],
      vim.log.levels.INFO,
      { title = "KrakenVim ━━ Welcome!", icon = " " }
    )
    local _ = require("alpha").start()
  end
end

function M.cmp_under(entry1, entry2)
  local _, entry1_under = entry1.completion_item.label:find "^_+"
  local _, entry2_under = entry2.completion_item.label:find "^_+"
  entry1_under = entry1_under or 0
  entry2_under = entry2_under or 0
  if entry1_under > entry2_under then
    return false
  elseif entry1_under < entry2_under then
    return true
  end
end

return M

-- vim:ft=lua
