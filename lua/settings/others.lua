local M = {}

function M.highlight_url()
  fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])
end

function M.grey_out_strikethrough()
  fn.matchadd("matchStrike", [[[~]\{2}.\+[~]\{2}]])
end

return M
