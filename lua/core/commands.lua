_G.GROUP = vim.api.nvim_create_augroup("DharmxGroup", {})
local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command

autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "MoreMsg",
      on_visual = true
    })
  end,
  group = GROUP,
})

autocmd({ "TermOpen", "BufReadCmd" }, {
  command = "set nonu nornu",
  pattern = { "term://*", "zsh", "*/zsh", "sh", "bash", "toggleterm" },
  group = GROUP,
})

autocmd("BufWritePre", {
  callback = function()
    local directory = vim.fn.expand("<afile>:p:h")
    if directory:find("%l+://") == 1 then return end
    if vim.fn.isdirectory(directory) == 0 then vim.fn.mkdir(directory, "p") end
  end,
  group = GROUP,
})

autocmd({ "FileType", "BufWinEnter" }, {
  pattern = "*.md",
  command = "silent! loadview",
  group = GROUP,
})

autocmd({ "FileType", "BufWinLeave" }, {
  pattern = "*.md",
  command = "mkview",
  group = GROUP,
})

autocmd("FileType", {
  pattern = { "checkhealth", "help", "notify", "oil", "qf", "query", "man://*" },
  command = "nmap <buffer> q :q<CR>",
  group = GROUP,
})

autocmd("FileType", {
  callback = function()
    if not vim.loop.fs_realpath("./gradlew") then return end
    vim.keymap.set("n", "<C-P>", "<cmd>Telescope gradle<CR>", {
      buffer = true,
      silent = true,
    })
  end,
  group = GROUP,
})

autocmd("FileType", {
  pattern = "notify",
  command = "set ft=markdown",
  group = GROUP,
})

autocmd("FileType", {
  pattern = "alpha",
  command = "nmap <buffer> q :Alpha<CR>",
  group = GROUP,
})

autocmd("FileType", {
  pattern = "tsplayground",
  command = "nmap <buffer> q :TSPlaygroundToggle<CR>",
  group = GROUP,
})

autocmd("FileType", {
  pattern = "qf",
  command = "setlocal number!",
  group = GROUP,
})

autocmd("InsertLeave", {
  callback = function() vim.diagnostic.enable(0) end,
  group = GROUP,
})

autocmd("InsertEnter", {
  callback = function() vim.diagnostic.disable(0) end,
  group = GROUP,
})

command("PickColors", function()
  local J = require("plenary.job")
    J:new({
      command = "xcolor",
      on_exit = vim.schedule_wrap(function(self, code, _)
        if code ~= 0 then
          vim.notify("Could not run xcolor.")
          return
        end
        local result = self:result()
        vim.notify("Copied " .. result[1]:upper() .. " into +.")
        vim.fn.setreg("+", result)
      end),
    }):start()
end, { nargs = 0 })

command("Paste", function(args)
  require("scratch.paste").command(args)
end, {
  desc = "Upload/delete files/snippets to a pastebin site.",
  range = true,
  bang = true,
  nargs = "?",
  complete = function(arg, name, _)
    if name:match("^'<,'>Paste") then return {} end
    if name:match("^Paste!") then
      return vim.tbl_keys(require("scratch.paste")._responses)
    end
    return vim.fn.getcompletion(arg, "file")
  end,
})

command("GHBrowse", function(args)
  local starting
  local ending
  local file = vim.F.if_nil(args.fargs[1], vim.fn.expand("%"))
  if args.range ~= 0 then
    starting = args.line1
    ending = args.line2
  end
  require("scratch.github").fetch_permalink(file, starting, ending, { open_browser = true })
end, {
  range = true,
  desc = "Browse GH.",
  complete = "file",
  nargs = "?",
})

command("Overview", function()
  require("scratch.overview").toggle()
end, {
  desc = "Open keymap overview.",
  nargs = 0,
})

command("View", function()
  require("scratch.view").view()
end, {
  desc = "Toggle image view.",
  nargs = 0,
})

command("ViewStop", function()
  require("scratch.view").stop()
end, {
  desc = "Close image view backend.",
  nargs = 0,
})

command("FormatNode", function()
  require("scratch.node").apply()
end, {
  desc = "Format node under the cursor.",
  nargs = 0,
})
