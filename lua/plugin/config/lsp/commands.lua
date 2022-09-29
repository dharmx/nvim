local M = {}

local nv = require("utils.neovim")
local alias = nv.alias
local buf_alias = nv.buf_alias
local lsp = vim.lsp
local lsp_util = require("utils.lsp")

function M.setup(client, buffer)
  if client.supports_method("textDocument/formatting") then
    nv.buf_alias(buffer, "Format", function()
      lsp_util.format(buffer)
    end)
  end

  if vim.bo.filetype == "java" then
    local jdtls = require("jdtls")
    buf_alias(buffer, "JDTCompile", function(args)
      jdtls.compile(args.fargs)
    end, { nargs = "?", complete = require("jdtls")._complete_compile, force = true })
    buf_alias(buffer, "JDTSetRuntime", function(args)
      jdtls.set_runtime(args.fargs)
    end, { nargs = "?", complete = jdtls._complete_set_runtime, force = true })

    buf_alias(buffer, "JDTUpdateProjectConfig", jdtls.update_project_config)
    buf_alias(buffer, "JDTJol", jdtls.jol)
    buf_alias(buffer, "JDTBytecode", jdtls.javap)
    buf_alias(buffer, "JDTJshell", jdtls.jshell)

    buf_alias(buffer, "JDTOrganizeImports", jdtls.organize_imports)
    buf_alias(buffer, "JDTExtractVariable", jdtls.extract_variable)
    buf_alias(buffer, "JDTExtractConstant", jdtls.extract_constant)

    buf_alias(buffer, "JDTExtractVariableTrue", function()
      jdtls.extract_variable(true)
    end)
    buf_alias(buffer, "JDTExtractConstantTrue", function()
      jdtls.extract_constant(true)
    end)
    buf_alias(buffer, "JDTExtractMethod", function()
      jdtls.extract_method(true)
    end)
  end
end

return M

-- vim:ft=lua
