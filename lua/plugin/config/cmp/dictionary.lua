local present, cmp_dictionary = pcall(require, "cmp_dictionary")

if not present then
  return
end

local stdpath_config = vim.fn.stdpath("config")

local function prepare(lang)
  return stdpath_config .. "/spell/" .. lang .. ".dict"
end

local config = {
  dic = {
    ["*"] = {
      prepare("en"),
      stdpath_config .. "/spell/en.utf-8.add",
    },
    filepath = {
      ["*.txt"] = {
        prepare("bn"),
        prepare("hi"),
      },
    },
  },
  exact = 2,
  first_case_insensitive = false,
  document = false,
  document_command = "wn %s -over",
  async = false,
  capacity = 15,
  debug = false,
}

cmp_dictionary.setup(config)

-- vim:ft=lua
