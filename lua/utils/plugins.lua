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
    cmd "Alpha"
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

function M.btn_gen(label, shortcut)
  return {
    type = "button",
    on_press = function()
      local key = api.nvim_replace_termcodes(shortcut:gsub("%s", ""):gsub("LDR", "<leader>"), true, false, true)
      api.nvim_feedkeys(key, "normal", false)
    end,
    val = label,
    opts = {
      position = "center",
      shortcut = shortcut,
      cursor = 5,
      width = 25,
      align_shortcut = "right",
      hl_shortcut = "AlphaKeyPrefix",
      hl = "AlphaButton",
    },
  }
end

return M

-- vim:ft=lua
