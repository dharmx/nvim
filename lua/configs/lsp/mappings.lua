local M = {}

M.setup = function(client, buffer)
  local mappings = {
    ["name"] = " LSP [" .. string.format(" %s", client.name) .. "]",
    ["r"] = { "<CMD>lua require('configs.lsp.handlers.rename').lsp_rename()<CR>", " Rename" },
    ["b"] = {
      ["name"] = " Actions",
      ["K"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", " Hover" },
      ["c"] = { "<CMD>lua vim.lsp.buf.code_action()<CR>", " Code action" },
      ["f"] = { "<CMD>lua vim.lsp.buf.formatting()<CR>", "ﯕ Format" },
      ["F"] = { "<CMD>lua vim.lsp.buf.formatting_seq_sync()<CR>", "ﯕ Format Seq" },
    },
    ["d"] = {
      ["name"] = " Diagnostics",
      ["e"] = { "<CMD>lua vim.diagnostic.open_float()<CR>", "ﭧ Diagnostics" },
      ["["] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "ﭧ Previous errors" },
      ["]"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "ﭧ Next errors" },
      ["q"] = { "<CMD>lua vim.diagnostic.setloclist()<CR>", " Set loclist" },
    },
    ["g"] = {
      ["name"] = " Definitions",
      ["D"] = { "<CMD>lua vim.lsp.buf.declaration()<CR>", " Goto declaration" },
      ["d"] = { "<CMD>lua vim.lsp.buf.definition()<CR>", " Goto definiton" },
      ["s"] = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "ﲀ Signature" },
      ["i"] = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "בּ Implementation" },
      ["t"] = { "<CMD>lua vim.lsp.buf.type_definition()<CR>", " Type definition" },
      ["r"] = { "<CMD>lua vim.lsp.buf.references()<CR>", " References" },
    },
    ["w"] = {
      ["name"] = " Workspaces",
      ["a"] = { "<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>", " Add workspace" },
      ["r"] = { "<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>", " Remove workspace" },
      ["l"] = { "<CMD>lua vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", " Workspaces" },
    },
  }

  local options = {
    mode = "n",
    silent = true,
    noremap = true,
    prefix = "<leader>l",
    buffer = buffer,
    nowait = true,
  }

  require("which-key").register(mappings, options)
end

return M

-- vim:ft=lua
