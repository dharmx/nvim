local M = {}

M.setup = function(client, buffer)
  local mappings = {
    ["name"] = " LSP [" .. string.format(" %s", client.name) .. "]",

    ["b"] = {
      ["name"] = " Actions",
      ["K"] = {
        "<CMD>lua vim.lsp.buf.hover()<CR>",
        " Hover",
      },
      ["c"] = {
        "<CMD>lua vim.lsp.buf.code_action()<CR>",
        " Code action",
      },
      ["r"] = {
        "<CMD>lua require('plugin.config.lsp.handlers.rename').lsp_rename()<CR>",
        "ﯕ Rename",
      },
      ["l"] = {
        "<CMD>lua require('utils.lsp').find_and_run_codelens()<CR>",
        "Find and run code-lens (up)",
      },
    },
    ["d"] = {
      ["name"] = " Diagnostics",
      ["e"] = {
        "<CMD>lua vim.diagnostic.open_float()<CR>",
        "ﭧ Diagnostics",
      },
      ["["] = {
        "<CMD>lua vim.diagnostic.goto_prev()<CR>",
        "ﭧ Previous errors",
      },
      ["]"] = {
        "<CMD>lua vim.diagnostic.goto_next()<CR>",
        "ﭧ Next errors",
      },
      ["q"] = {
        "<CMD>lua vim.diagnostic.setloclist()<CR>",
        " Set loclist",
      },
    },
    ["g"] = {
      ["name"] = " Definitions",
      ["D"] = {
        "<CMD>lua vim.lsp.buf.declaration()<CR>",
        " Goto declaration",
      },
      ["d"] = {
        "<CMD>lua vim.lsp.buf.definition()<CR>",
        " Goto definition",
      },
      ["s"] = {
        "<CMD>lua vim.lsp.buf.signature_help()<CR>",
        "ﲀ Signature",
      },
      ["i"] = {
        "<CMD>lua vim.lsp.buf.implementation()<CR>",
        "בּ Implementation",
      },
      ["t"] = {
        "<CMD>lua vim.lsp.buf.type_definition()<CR>",
        " Type definition",
      },
      ["r"] = {
        "<CMD>lua vim.lsp.buf.references()<CR>",
        " References",
      },
      ["c"] = {
        "<CMD>lua vim.lsp.buf.clear_references()<CR>",
        " Clear References",
      },
    },
    ["w"] = {
      ["name"] = " Workspaces",
      ["a"] = {
        "<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>",
        " Add workspace",
      },
      ["r"] = {
        "<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>",
        " Remove workspace",
      },
      ["l"] = {
        "<CMD>lua vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        " Workspaces",
      },
    },
  }

  if vim.bo.filetype == "java" then
    mappings["j"] = {
      ["name"] = " JDT Options",
      ["c"] = {
        "<CMD>JDTCompile<CR>",
        " Compile",
      },
      ["r"] = {
        "<CMD>JDTSetRuntime<CR>",
        "ﰌ Set runtime",
      },
      ["u"] = {
        "<CMD>JDTUpdateProjectConfig<CR>",
        "ﮮ Update project config",
      },
      ["j"] = {
        "<CMD>JDTJol<CR>",
        " JOL",
      },
      ["b"] = {
        "<CMD>JDTBytecode<CR>",
        " View bytecode",
      },
      ["s"] = {
        "<CMD>JDTJshell<CR>",
        " JShell",
      },
      ["o"] = {
        "<CMD>JDTOrganizeImports<CR>",
        " Organize imports",
      },
      ["v"] = {
        "<CMD>JDTExtractVariable<CR>",
        " Extract variable",
      },
      ["k"] = {
        "<CMD>JDTExtractConstant<CR>",
        " Extract constant",
      },
      ["V"] = {
        "<CMD>JDTExtractVariableTrue<CR>",
        " Extract variable",
      },
      ["K"] = {
        "<CMD>JDTExtractConstantTrue<CR>",
        "﴾ Extract constant",
      },
      ["M"] = {
        "<CMD>JDTExtractMethod<CR>",
        " Extract function",
      },
    }
  end

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
