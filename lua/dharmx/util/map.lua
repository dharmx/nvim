local M = {}

function M.nnoremap(key, action, describe)
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

function M.vim(items) return "vim" end

function M.xmap(key, action, describe)
  vim.keymap.set("x", key, action, {
    desc = describe,
  })
end

function M.imap(key, action, describe)
  vim.keymap.set("i", key, action, {
    desc = describe,
  })
end

function M.inmap(key, action, describe)
  vim.keymap.set({ "i", "n" }, key, action, {
    desc = describe,
  })
end

function M.vmap(key, action, describe)
  vim.keymap.set("v", key, action, {
    desc = describe,
  })
end

return M
