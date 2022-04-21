--- LSP utility functions
--- @module utils.lsp

local M = {}

--- Toggles autosave mode for the current buffer.
-- @todo it is dependent on a global variable so that makes it difficult to track
-- when multiple buffer want auto-format.
-- NOTE: As of this moment you need to toggle off the autosave in the current buffer
-- NOTE: and then move onto the next and then re-toggle to use autosave in that buffer
function M.autosave()
  local active_clients = lsp.buf_get_clients() -- @see help buf_get_clients

  -- loop through all attached LSP clients and find choose one which supports
  -- formatting.
  -- TODO: I feel like this isn't the right approach, need to investigate.
  for _, client in ipairs(active_clients) do
    if client.resolved_capabilities.document_formatting then
      if g._autosave then
        api.nvim_del_augroup_by_name "AutoSaveOnNormalMode"
        notify {
          message = "Autosave disabled",
          icon = " ",
          title = " LSP:" .. client.name,
        }
        -- TODO: Improve so that all buffers will be tracked
        g._autosave = false -- if there is no autosave support
      else
        augroup("AutoSaveOnNormalMode", {
          {
            events = {
              "BufWritePre",
              "FocusLost",
              "BufEnter",
              "InsertLeave",
              "WinEnter",
            },
            command = lsb.formatting_sync, -- @see help formatting_sync
            options = { buffer = 0 },
          },
        })
        notify {
          message = "Autosave enabled",
          icon = " ",
          title = " LSP:" .. client.name,
        }
        g._autosave = true -- if autosave is available
      end
      return
    end
  end
end

--- Applies highlights and defines the icon to LSP symbols like
--- hints, warn, ... they are displayed at the number column.
-- @param group the highlight group of the symbol icon.
-- @param text_group the highlight group of the symbol text.
-- @param icon the symbol glyph
-- @see help sign_define
-- @see help vim.diagnostic.severity
function M.lsp_signdef(group, icon, text_group)
  fn.sign_define(group, { text = icon, texthl = text_group })
end

return M

-- vim:ft=lua
