--- Set up other global stuff.

local M = {}

--- Highlight URL
-- @see help matchadd
function M.highlight_url()
  fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])
end

--- Highlight striked out text as grey
-- @see help matchadd
function M.grey_out_strikethrough()
  fn.matchadd("matchStrike", [[[~]\{2}.\+[~]\{2}]])
end

return M

-- vim:ft=lua
