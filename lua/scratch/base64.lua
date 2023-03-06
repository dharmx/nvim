local M = {}

local bytes_global = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

local encode_helpers = {
  function(x)
    local r, b = "", x:byte()
    for index = 8, 1, -1 do
      r = r .. (b % 2 ^ index - b % 2 ^ (index - 1) > 0 and "1" or "0")
    end
    return r
  end,
  function(x)
    if #x < 6 then return "" end
    local item = 0
    for index = 1, 6 do
      item = item + (x:sub(index, index) == "1" and 2 ^ (6 - index) or 0)
    end
    return bytes_global:sub(item + 1, item + 1)
  end,
}

local decode_helpers = {
  function(x)
    if x == "=" then return "" end
    local r, f = "", (bytes_global:find(x) - 1)
    for index = 6, 1, -1 do
      r = r .. (f % 2 ^ index - f % 2 ^ (index - 1) > 0 and "1" or "0")
    end
    return r
  end,
  function(x)
    if #x ~= 8 then return "" end
    local c = 0
    for index = 1, 8 do
      c = c + (x:sub(index, index) == "1" and 2 ^ (8 - index) or 0)
    end
    return string.char(c)
  end,
}

function M.encode(data)
  local _data = (data:gsub(".", encode_helpers[1]) .. "0000"):gsub("%d%d%d?%d?%d?%d?", encode_helpers[2])
  return (_data .. ({ "", "==", "=" })[#data % 3 + 1])
end

function M.decode(data)
  data = string.gsub(data, "[^" .. bytes_global .. "=]", "")
  return (data:gsub(".", decode_helpers[1]):gsub("%d%d%d?%d?%d?%d?%d?%d?", decode_helpers[2]))
end

return M
