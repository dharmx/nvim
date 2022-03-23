local M = {}

M.setup = function(client, buffer)
  local mappings = {
    ["name"] = " LSP [" .. string.format(" %s", client.name) .. "]",

    ["b"] = {
      ["name"] = " Actions",
      ["K"] = { "<CMD>lua lsb.hover()<CR>", " Hover" },
      ["k"] = { "<CMD>Lspsaga hover_doc<CR>", " Hover" },
      ["c"] = { "<CMD>lua require('utils.loaders').load_ui_select(); lsb.code_action()<CR>", " Code action" },
      ["f"] = { "<CMD>lua lsb.formatting()<CR>", "ﯕ Format" },
      ["r"] = { "<CMD>lua require('configs.lsp.handlers.rename').lsp_rename()<CR>", "ﯕ Format" },
      ["F"] = { "<CMD>lua lsb.formatting_seq_sync()<CR>", "ﯕ Format Seq" },
      ["T"] = { "<CMD>ToggleAutoFormat<CR>", "ﯕ  Auto formatting" },
    },
    ["d"] = {
      ["name"] = " Diagnostics",
      ["e"] = { "<CMD>lua diagnostic.open_float()<CR>", "ﭧ Diagnostics" },
      ["["] = { "<CMD>lua diagnostic.goto_prev()<CR>", "ﭧ Previous errors" },
      ["]"] = { "<CMD>lua diagnostic.goto_next()<CR>", "ﭧ Next errors" },
      ["q"] = { "<CMD>lua diagnostic.setloclist()<CR>", " Set loclist" },
      ["y"] = { "<CMD>Lspsaga yank_line_diagnostics<CR>", " Yank line diagnostics" },
    },
    ["g"] = {
      ["name"] = " Definitions",
      ["D"] = { "<CMD>lua lsb.declaration()<CR>", " Goto declaration" },
      ["d"] = { "<CMD>lua lsb.definition()<CR>", " Goto definiton" },
      ["s"] = { "<CMD>lua lsb.signature_help()<CR>", "ﲀ Signature" },
      ["i"] = { "<CMD>lua lsb.implementation()<CR>", "בּ Implementation" },
      ["I"] = { "<CMD>Lspsaga implement<CR>", "בּ Implementation" },
      ["t"] = { "<CMD>lua lsb.type_definition()<CR>", " Type definition" },
      ["r"] = { "<CMD>lua lsb.references()<CR>", " References" },
      ["f"] = { "<CMD>Lspsaga lsp_finder<CR>", " LSP Finder" },
    },
    ["w"] = {
      ["name"] = " Workspaces",
      ["a"] = { "<CMD>lua lsb.add_workspace_folder()<CR>", " Add workspace" },
      ["r"] = { "<CMD>lua lsb.remove_workspace_folder()<CR>", " Remove workspace" },
      ["l"] = { "<CMD>lua notify(inspect(lsb.list_workspace_folders()))<CR>", " Workspaces" },
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
