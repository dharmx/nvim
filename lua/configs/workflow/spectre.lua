local present, spectre = pcall(require, "spectre")

if not present then
  return
end

local config = {
  color_devicons = true,
  highlight = {
    ui = "String",
    search = "DiffChange",
    replace = "DiffDelete",
  },
  line_sep_start = "",
  result_padding = "    ",
  line_sep = "",
}

spectre.setup(config)

-- vim:ft=lua
