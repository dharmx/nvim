local M = {}

function M.autosave()
  local active_clients = lsp.buf_get_clients()
  for _, client in ipairs(active_clients) do
    if client.resolved_capabilities.document_formatting then
      if g._autosave then
        api.nvim_del_augroup_by_name "AutoSaveOnNormalMode"
        notify {
          message = "Autosave disabled",
          icon = " ",
          title = " LSP:" .. client.name,
        }
        g._autosave = false
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
            command = buf.formatting_sync,
            options = { buffer = api.nvim_get_current_buf() },
          },
        })
        notify {
          message = "Autosave enabled",
          icon = " ",
          title = " LSP:" .. client.name,
        }
        g._autosave = true
      end
      return
    end
  end
end

function M.lsp_signdef(group, icon, text_group)
  fn.sign_define(group, { text = icon, texthl = text_group })
end

return M

-- vim:ft=lua
