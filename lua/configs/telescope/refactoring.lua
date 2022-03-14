local present, refact = pcall(require, "refactoring")

if not present then
  return
end

local config = {
  prompt_func_return_type = {
    cpp = true,
    c = true,
    java = true,
  },
  prompt_func_param_type = {
    cpp = true,
    c = true,
    java = true,
  },
}

refact.setup(config)

-- vim:ft=lua
