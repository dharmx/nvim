local M = {}

M.setup = function(client, buffer)
  local mappings = {
    ["name"] = " LSP [" .. string.format(" %s", client.name) .. "]",

    ["b"] = {
      ["name"] = " Actions",
      ["K"] = { "<CMD>lua buf.hover()<CR>", " Hover" },
      ["c"] = { "<CMD>lua utils.load_ui_select(); buf.code_action()<CR>", " Code action" },
      ["f"] = { "<CMD>lua buf.formatting()<CR>", "ﯕ Format" },
      ["r"] = { "<CMD>lua require('configs.lsp.handlers.rename').lsp_rename()<CR>", "ﯕ Format" },
      ["F"] = { "<CMD>lua buf.formatting_seq_sync()<CR>", "ﯕ Format Seq" },
      ["T"] = { "<CMD>ToggleAutoFormat<CR>", "ﯕ  Auto formatting" },
    },
    ["d"] = {
      ["name"] = " Diagnostics",
      ["e"] = { "<CMD>lua diagnostic.open_float()<CR>", "ﭧ Diagnostics" },
      ["["] = { "<CMD>lua diagnostic.goto_prev()<CR>", "ﭧ Previous errors" },
      ["]"] = { "<CMD>lua diagnostic.goto_next()<CR>", "ﭧ Next errors" },
      ["q"] = { "<CMD>lua diagnostic.setloclist()<CR>", " Set loclist" },
    },
    ["g"] = {
      ["name"] = " Definitions",
      ["D"] = { "<CMD>lua buf.declaration()<CR>", " Goto declaration" },
      ["d"] = { "<CMD>lua buf.definition()<CR>", " Goto definiton" },
      ["s"] = { "<CMD>lua buf.signature_help()<CR>", "ﲀ Signature" },
      ["i"] = { "<CMD>lua buf.implementation()<CR>", "בּ Implementation" },
      ["t"] = { "<CMD>lua buf.type_definition()<CR>", " Type definition" },
      ["r"] = { "<CMD>lua buf.references()<CR>", " References" },
    },
    ["w"] = {
      ["name"] = " Workspaces",
      ["a"] = { "<CMD>lua buf.add_workspace_folder()<CR>", " Add workspace" },
      ["r"] = { "<CMD>lua buf.remove_workspace_folder()<CR>", " Remove workspace" },
      ["l"] = { "<CMD>lua notify(inspect(buf.list_workspace_folders()))<CR>", " Workspaces" },
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
