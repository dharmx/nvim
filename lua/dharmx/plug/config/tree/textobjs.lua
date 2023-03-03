local ok, textobjs = pcall(require, "various-textobjs")
if not ok then return end

textobjs.setup({ useDefaultKeymaps = true })
