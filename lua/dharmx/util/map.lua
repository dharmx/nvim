local M = {}

function M.nnoremap(key, action, describe)
  vim.keymap.set("n", key, action, {
    desc = describe,
    noremap = true,
    silent = true,
  })
end

function M.vnoremap(key, action, describe)
  vim.keymap.set("v", key, action, {
    desc = describe,
    noremap = true,
    silent = true,
  })
end

function M.nmap(key, action, describe)
  if type(describe) == "string" then describe = { desc = describe } end
  vim.keymap.set("n", key, action, describe)
end

function M.xmap(key, action, describe)
  if type(describe) == "string" then describe = { desc = describe } end
  vim.keymap.set("x", key, action, describe)
end

function M.imap(key, action, describe)
  if type(describe) == "string" then describe = { desc = describe } end
  vim.keymap.set("i", key, action, describe)
end

function M.inmap(key, action, describe)
  if type(describe) == "string" then describe = { desc = describe } end
  vim.keymap.set({ "i", "n" }, key, action, describe)
end

function M.vmap(key, action, describe)
  if type(describe) == "string" then describe = { desc = describe } end
  vim.keymap.set("v", key, action, describe)
end

function M.nvmap(key, action, describe)
  if type(describe) == "string" then describe = { desc = describe } end
  vim.keymap.set({ "n", "v" }, key, action, describe)
end

return M
