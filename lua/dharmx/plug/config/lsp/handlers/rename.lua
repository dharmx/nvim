local Input = require("nui.input")
local event = require("nui.utils.autocmd").event
local NuiText = require("nui.text")

local function nui_lsp_rename()
  local curr_name = vim.fn.expand("<cword>")
  local params = vim.lsp.util.make_position_params(0, vim.bo.fileencoding)

  local function on_submit(new_name)
    if not new_name or #new_name == 0 then
      vim.api.nvim_notify("Cancelled: New name is empty!", vim.log.levels.INFO, {
        icon = "ﰸ",
        title = " LSP",
      })
      return
    elseif new_name == curr_name then
      vim.api.nvim_notify("Cancelled: New and current names are the same!", vim.log.levels.INFO, {
        icon = "",
        title = " LSP",
      })
      return
    end

    params.newName = new_name
    vim.lsp.buf_request(0, "textDocument/rename", params, function(_, result, ctx, _)
      if not result then return end
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)

      local total_files = vim.tbl_count(result.changes)
      print(string.format("Changed %s file%s. To save them run ':wa'", total_files, total_files > 1 and "s" or ""))
      vim.api.nvim_notify("Renamed " .. curr_name .. " into " .. new_name .. ".", vim.log.levels.INFO, {
        icon = "",
        title = " LSP",
      })
    end)
  end

  local popup_options = {
    border = {
      style = {
        top_left = NuiText(" ", "NUINormal"),
        top = NuiText("━", "NUILine"),
        top_right = NuiText(" ", "NUINormal"),
        left = NuiText(" ", "NUINormal"),
        right = NuiText(" ", "NUINormal"),
        bottom_left = NuiText(" ", "NUINormal"),
        bottom = NuiText(" ", "NUINormal"),
        bottom_right = NuiText(" ", "NUINormal"),
      },
      text = {
        top = NuiText("RENAME ", "NUIHeading"),
        top_align = "left",
      },
    },
    winblend = 0,
    highlight = "NUIText:NUIText",
    relative = {
      type = "buf",
      position = {
        row = params.position.line,
        col = params.position.character,
      },
    },
    position = {
      row = 1,
      col = 0,
    },
    size = {
      width = 25,
      height = 1,
    },
  }

  local input = Input(popup_options, {
    default_value = curr_name,
    on_submit = on_submit,
    prompt = NuiText(" ﬦ ", "NUIPrompt"),
  })

  input:mount()
  vim.schedule(function() vim.api.nvim_command("stopinsert") end)
  input:map("n", "<esc>", input.input_props.on_close, { noremap = true })
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

return {
  lsp_rename = nui_lsp_rename,
}

-- vim:filetype=lua
