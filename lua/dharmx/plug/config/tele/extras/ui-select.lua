local strings = require("plenary.strings")
local entry_display = require("telescope.pickers.entry_display")
local themes = require("telescope.themes")

return {
  themes.get_dropdown({
    layout_strategy = "cursor",
  }),
  specific_opts = {
    codeaction = {
      make_indexed = function(items)
        local indexed_items = {}
        local null_ls = {}
        local widths = {
          idx = 0,
          command_title = 0,
          client_name = 0,
        }

        for idx, item in ipairs(items) do
          local client = vim.lsp.get_client_by_id(item[1])
          local entry = {
            idx = idx,
            ["add"] = {
              command_title = item[2].title:gsub("\r\n", "\\r\\n"):gsub("\n", "\\n"),
              client_name = client and client.name or "",
            },
            text = item,
          }

          -- magic
          if client.name == "null-ls" then
            table.insert(null_ls, entry)
          else
            table.insert(indexed_items, entry)
          end

          widths.idx = math.max(widths.idx, strings.strdisplaywidth(entry.idx))
          widths.command_title = math.max(widths.command_title, strings.strdisplaywidth(entry.add.command_title))
          widths.client_name = math.max(widths.client_name, strings.strdisplaywidth(entry.add.client_name))
        end

        for _, entry in ipairs(null_ls) do
          table.insert(indexed_items, entry)
        end
        return indexed_items, widths
      end,
      make_displayer = function(widths)
        return entry_display.create({
          separator = " ",
          items = {
            { width = widths.idx + 1 }, -- +1 for ":" suffix
            { width = widths.command_title },
            { width = widths.client_name },
          },
        })
      end,
      make_display = function(displayer)
        return function(e)
          return displayer({
            { e.value.idx .. ":", "TelescopePromptPrefix" },
            { e.value.add.command_title },
            { e.value.add.client_name, "TelescopeResultsComment" },
          })
        end
      end,
      make_ordinal = function(e) return e.idx .. e.add["command_title"] end,
    },
  },
}

-- vim:filetype=lua
