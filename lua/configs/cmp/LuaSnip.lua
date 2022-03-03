local present, luasnip = pcall(require, "luasnip")

if not present then
  return
end

local snippet = luasnip.snippet
local text = luasnip.text_node
local fnode = luasnip.function_node
local insert = luasnip.insert_node

luasnip.config.set_config {
  history = true,
  region_check_events = "CursorMoved,CursorHold,InsertEnter",
  delete_check_events = "InsertLeave",
  enable_autosnippets = true,
}

luasnip.snippets = {
  lua = {
    -- credit: akinsho, nuxshed
    snippet({
      trig = "use",
      name = "packer use",
      dscr = {
        "packer use plugin block",
        "e.g.",
        "use {\n  'author/plugin',\n  config = function()\n    ...\n  end\n}",
      },
    }, {
      text "use { '",
      -- Get the author and URL in the clipboard and auto populate the author and project
      fnode(function(_)
        local default = ""
        local clip = vim.fn.getreg "*"
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
      text "' ",
      insert(2, { ",  config = function()", "", "end" }),
      text "}",
    }),
    snippet({
      trig = "use",
      name = "packer use",
      dscr = { "packer use plugin block", "e.g.", "use { 'author/plugin' }" },
    }, {
      text "use { '",
      -- Get the author and URL in the clipboard and auto populate the author and project
      fnode(function(_)
        local default = ""
        local clip = vim.fn.getreg "*"
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
      text "' }",
    }),
    snippet({
      trig = "pcall",
      name = "pcall",
      dscr = { "safe require module", "e.g.", 'pcall(require, "module")' },
    }, {
      text 'pcall(require, "")',
    }),
    snippet({
      trig = "pcall",
      name = "pcall",
      dscr = { "safe require module with variables", "e.g.", 'local prsent, module = pcall(require, "module")' },
    }, {
      text 'local present, module = pcall(require, "module")',
    }),
  },
}

require("luasnip.loaders.from_vscode").lazy_load {
  paths = vim.fn.stdpath "config",
  include = { "lua", "python", "java", "sh", "markdown" },
}
