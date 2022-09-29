local present, rgxplain = pcall(require, "regexplainer")

if not present then
  return
end

local config = {
  mode = "narrative",
  auto = true,
  display = "popup",
  popup = {
    border = {
      padding = { 1, 2 },
      style = "solid",
    },
  },
  mappings = {
    toggle = "gR",
    show = "gS",
    hide = "gH",
    show_split = "gP",
    show_popup = "gU",
  },
  narrative = {
    separator = "\n",
  },
}

rgxplain.setup(config)

-- vim:ft=lua
