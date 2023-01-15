local Input = require("nui.input")
local event = require("nui.utils.autocmd").event
local NuiText = require("nui.text")

local function nui_lsp_rename()
  local curr_name = vim.fn.expand("<cword>")
  local params = vim.lsp.util.make_position_params()

  local function on_submit(new_name)
    if not new_name or #new_name == 0 then
      -- do nothing if `new_name` is empty or not changed.
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
    -- border for the window
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
    -- highlight for the window.
    winblend = 0,
    highlight = "NUIText:NUIText",
    -- place the popup window relative to the
    -- buffer position of the identifier
    relative = {
      type = "buf",
      position = {
        -- this is the same `params` we got earlier
        row = params.position.line,
        col = params.position.character,
      },
    },
    -- position the popup window on the line below identifier
    position = {
      row = 1,
      col = 0,
    },
    -- 25 cells wide, should be enough for most identifier names
    size = {
      width = 25,
      height = 1,
    },
  }

  local input = Input(popup_options, {
    -- set the default value to current name
    default_value = curr_name,
    -- pass the `on_submit` callback function we wrote earlier
    on_submit = on_submit,
    prompt = NuiText(" ﬦ ", "NUIPrompt"),
  })

  input:mount()
  vim.schedule(function() vim.api.nvim_command("stopinsert") end)

  -- close on <esc> in normal mode
  input:map("n", "<esc>", input.input_props.on_close, { noremap = true })

  -- close when cursor leaves the buffer
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

return {
  lsp_rename = nui_lsp_rename,
}

-- vim:filetype=lua
