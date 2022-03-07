return {
  setup = function(client)
    if client and client.resolved_capabilities.document_highlight then
      local cmd = vim.api.nvim_command
      cmd "augroup LspDocumentHighlight"
      cmd "  autocmd! * <buffer>"
      cmd "  autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()"
      cmd "  autocmd! CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()"
      cmd "  autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()"
      cmd "augroup END"
    end
  end,
}
