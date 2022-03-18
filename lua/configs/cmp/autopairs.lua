local present, autopairs = pcall(require, "nvim-autopairs")

if not present then
  return
end

local config = {
  check_ts = true,
  close_triple_quotes = true,
  ts_config = {
    lua = { "string" },
    python = { "string" },
    javascript = { "template_string" },
  },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'", "<" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
  disable_filetype = { "lsp-installer", "NvimTree", "alpha", "TelescopePrompt", "packer", "Trouble" },
}

autopairs.setup(config)

-- vim:ft=lua
