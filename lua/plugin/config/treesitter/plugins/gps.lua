local present, gps = pcall(require, "nvim-gps")

if not present then
  return
end

local config = {
  disable_icons = false,
  icons = {
    ["class-name"] = " ",
    ["function-name"] = " ",
    ["method-name"] = " ",
    ["container-name"] = " ",
    ["tag-name"] = " ",
  },
  languages = {
    ["json"] = {
      icons = {
        ["array-name"] = " ",
        ["object-name"] = " ",
        ["null-name"] = " ",
        ["boolean-name"] = " ",
        ["number-name"] = " ",
        ["string-name"] = " ",
        ["float-name"] = " ",
      },
    },
    ["toml"] = {
      icons = {
        ["table-name"] = " ",
        ["array-name"] = " ",
        ["boolean-name"] = " ",
        ["date-name"] = "﬑ ",
        ["date-time-name"] = " ",
        ["float-name"] = " ",
        ["inline-table-name"] = " ",
        ["integer-name"] = " ",
        ["string-name"] = " ",
        ["time-name"] = " ",
      },
    },
    ["verilog"] = { icons = { ["module-name"] = "﬙ " } },
    ["yaml"] = {
      icons = {
        ["mapping-name"] = " ",
        ["sequence-name"] = " ",
        ["null-name"] = " ",
        ["boolean-name"] = " ",
        ["integer-name"] = " ",
        ["float-name"] = " ",
        ["string-name"] = " ",
      },
    },
    ["bash"] = false,
    ["sh"] = false,
    ["fish"] = false,
    ["zsh"] = false,
    ["perl"] = false,
    ["ruby"] = {
      separator = ":",
      icons = {
        ["function-name"] = " ",
        ["tag-name"] = "ﮉ ",
        ["class-name"] = " ",
        ["method-name"] = " ",
      },
    },
  },
  separator = "  ",
  depth = 7,
  depth_limit_indicator = "…",
}

gps.setup(config)

-- vim:ft=lua
