local M = {}

local luasnip = require("luasnip")
local text = luasnip.text_node
local fnode = luasnip.function_node
local insert = luasnip.insert_node
local fn = vim.fn

-- credit: akinsho, nuxshed
M[1] = {
  {
    trig = "use",
    name = "packer use",
    dscr = {
      "packer use plugin block",
      "e.g.",
      "use {\n  'author/plugin',\n  config = function()\n    ...\n  end\n}",
    },
  },
  {
    text("use {'"),
    -- Get the author and URL in the clipboard and auto populate the author and project
    fnode(function(_)
      local default = ""
      local clip = fn.getreg("*")
      if not vim.startswith(clip, "https://github.com/") then
        return default
      end
      local parts = vim.split(clip, "/")
      if #parts < 2 then
        return default
      end
      local author, project = parts[#parts - 1], parts[#parts]
      return author .. "/" .. project
    end, {}),
    text("' "),
    insert(2, { ",  config = function()", "", "end" }),
    text("}"),
  },
}

M[2] = {
  {
    trig = "use",
    name = "packer use",
    dscr = { "packer use plugin block", "e.g.", "use { 'author/plugin' }" },
  },
  {
    text("use { '"),
    -- Get the author and URL in the clipboard and auto populate the author and project
    fnode(function(_)
      local default = ""
      local clip = fn.getreg("*")
      if not vim.startswith(clip, "https://github.com/") then
        return default
      end
      local parts = vim.split(clip, "/")
      if #parts < 2 then
        return default
      end
      local author, project = parts[#parts - 1], parts[#parts]
      return author .. "/" .. project
    end, {}),
    text("' }"),
  },
}

M[3] = {
  {
    trig = "pcall",
    name = "pcall",
    dscr = { "safe require module", "e.g.", 'pcall(require, "module")' },
  },
  {
    text('pcall(require, "")'),
  },
}

M[4] = {
  {
    trig = "pcall",
    name = "pcall",
    dscr = { "safe require module with variables", "e.g.", 'local prsent, module = pcall(require, "module")' },
  },
  {
    text('local present, module = pcall(require, "module")'),
  },
}

return vim.tbl_map(function(snippet)
  return luasnip.snippet(snippet[1], snippet[2])
end, M)

-- vim:ft=lua
