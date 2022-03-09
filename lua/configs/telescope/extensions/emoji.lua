local present, emoji = pcall(require, "telescope-emoji")

if not present then
  return
end

local config = {
  action = function(emoji)
    -- argument emoji is a table.
    -- {name="", value="", cagegory="", description=""}
    fn.setreg("+", emoji.value)
    print([[Press p or "*p to paste this emoji]] .. emoji.value)
  end,
}

emoji.setup(config)

-- vim:ft=lua
