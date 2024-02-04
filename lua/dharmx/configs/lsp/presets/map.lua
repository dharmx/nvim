local M = {}

function M.setup(_, buffer)
  local options = { noremap = true, silent = true, buffer = buffer }
  vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, options)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, options)
  vim.keymap.set("n", "<leader>gk", vim.lsp.buf.hover, options)
  vim.keymap.set("n", "<leader>gb", vim.lsp.buf.implementation, options)
  vim.keymap.set("n", "<leader>gK", vim.lsp.buf.signature_help, options)
  vim.keymap.set("n", "<leader>ga", vim.lsp.buf.add_workspace_folder, options)
  vim.keymap.set("n", "<leader>gi", vim.diagnostic.goto_next, options)
  vim.keymap.set("n", "<leader>go", vim.diagnostic.goto_prev, options)
  vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, options)
  vim.keymap.set("n", "<leader>rn", require("dharmx.configs.lsp.handlers.rename").lsp_rename, options)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, options)
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, options)
  vim.keymap.set("n", "<leader>ge", vim.diagnostic.open_float, options)
  vim.keymap.set("n", "<leader>gl", vim.diagnostic.setloclist, options)
end

return M
