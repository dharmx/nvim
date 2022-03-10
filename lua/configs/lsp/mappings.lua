local M = {}

M.setup = function(client_name, buffer)
  local pretty = string.format(" %s", client_name)
  local mappings = {
    ["<space>e"] = { "<CMD>lua vim.diagnostic.open_float()<CR>", "ﭧ Diagnostics" },
    ["[d"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "ﭧ Previous errors" },
    ["]d"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "ﭧ Next errors" },
    ["<space>q"] = { "<CMD>lua vim.diagnostic.setloclist()<CR>", " Set loclist" },
    ["gD"] = { "<CMD>lua vim.lsp.buf.declaration()<CR>", " Goto declaration" },
    ["gd"] = { "<CMD>lua vim.lsp.buf.definition()<CR>", " Goto definiton" },
    ["K"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", " Hover" },
    ["gi"] = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "בּ Implementation" },
    ["<C-k>"] = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "ﲀ Signature" },
    ["<space>wa"] = { "<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>", " Add workspace" },
    ["<space>wr"] = { "<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>", " Remove workspace" },
    ["<space>wl"] = {
      "<CMD>lua vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
      " Workspaces",
    },
    ["<space>D"] = { "<CMD>lua vim.lsp.buf.type_definition()<CR>", " Type definition" },
    ["<space>rn"] = { "<CMD>lua require('configs.lsp.rename').lsp_rename()<CR>", " Rename" },
    ["<space>ca"] = { "<CMD>lua vim.lsp.buf.code_action()<CR>", " Code action" },
    ["gr"] = { "<CMD>lua vim.lsp.buf.references()<CR>", " References" },
    ["<space>f"] = { "<CMD>lua vim.lsp.buf.formatting()<CR>", "ﯕ Format" },
  }

  for _, definiton in pairs(mappings) do
    definiton[2] = definiton[2] .. " [" .. pretty .. "]"
  end
  mappings["name"] = pretty

  local options = {
    mode = "n",
    silent = true,
    noremap = true,
    buffer = buffer,
    nowait = true,
  }

  require("which-key").register(mappings, options)
end

return M

-- vim:ft=lua
