local M = {}

function M.nnmap(key, action, describe)
  vim.keymap.set("n", key, action, {
    desc = describe,
    noremap = true,
    silent = true,
  })
end

function M.nmap(key, action, describe)
  vim.keymap.set("n", key, action, {
    desc = describe,
  })
end

function M.xmap(key, action, describe)
  vim.keymap.set("x", key, action, {
    desc = describe,
  })
end

function M.vmap(key, action, describe)
  vim.keymap.set("v", key, action, {
    desc = describe,
  })
end

return M
