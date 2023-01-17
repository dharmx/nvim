---@diagnostic disable: unused-local
local M = {}

local util = require("dharmx.util.nvim")
local balias = util.balias

function M.setup(client, buffer)
  if vim.bo.filetype == "java" then
    local jdtls = require("jdtls")
    balias(buffer, "JDTCompile", function(args) jdtls.compile(args.fargs) end, {
      nargs = "?",
      complete = require("jdtls")._complete_compile,
      force = true,
    })
    balias(buffer, "JDTSetRuntime", function(args) jdtls.set_runtime(args.fargs) end, {
      nargs = "?",
      complete = jdtls._complete_set_runtime,
      force = true,
    })

    balias(buffer, "JDTUpdateProjectConfig", jdtls.update_project_config)
    balias(buffer, "JDTJol", jdtls.jol)
    balias(buffer, "JDTBytecode", jdtls.javap)
    balias(buffer, "JDTJshell", jdtls.jshell)

    balias(buffer, "JDTOrganizeImports", jdtls.organize_imports)
    balias(buffer, "JDTExtractVariable", jdtls.extract_variable)
    balias(buffer, "JDTExtractConstant", jdtls.extract_constant)

    balias(buffer, "JDTExtractVariableTrue", function() jdtls.extract_variable(true) end)
    balias(buffer, "JDTExtractConstantTrue", function() jdtls.extract_constant(true) end)
    balias(buffer, "JDTExtractMethod", function() jdtls.extract_method(true) end)
  end
end

return M

-- vim:filetype=lua
