--- NOTE: all list of language icons for presence.nvim, the discord-rpc client for neovim.
--- TODO: use classes for representating icons, in order to map though them

local function lambda(filename)
  return {
    [filename] = {
      filename:sub(1, 1):upper() .. filename:sub(2),
      "https://raw.githubusercontent.com/smokes/vscode-discord-assets/master/" .. filename .. ".png",
    },
  }
end

local wrapped = vim.tbl_map(lambda, {
  "ahk",
  "android",
  "angular",
  "applescript",
  "appveyor",
  "arduino",
  "as",
  "asp",
  "assembly",
  "autoit",
  "babel",
  "bat",
  "bower",
  "brainfuck",
  "c",
  "cargo",
  "circleci",
  "clojure",
  "cmake",
  "codeclimate",
  "coffee",
  "cpp",
  "crystal",
  "csharp",
  "cshtml",
  "css",
  "cssmap",
  "cuda",
  "d",
  "dart",
  "debug",
  "delphi",
  "dm",
  "docker",
  "editorconfig",
  "ejs",
  "elixir",
  "elm",
  "env",
  "erlang",
  "eslint",
  "firebase",
  "flowconfig",
  "fsharp",
  "gatsbyjs",
  "gemfile",
  "git",
  "go",
  "gradle",
  "graphql",
  "gruntfile",
  "gulp",
  "handlebars",
  "haskell",
  "haxe",
  "heroku",
  "html",
  "http",
  "jar",
  "java",
  "jest",
  "js",
  "jsmap",
  "json",
  "jsx",
  "julia",
  "kotlin",
  "less",
  "lisp",
  "livescript",
  "log",
  "lua",
  "makefile",
  "manifest",
  "markdown",
  "markdownx",
  "marko",
  "nim",
  "nodemon",
  "npm",
  "objc",
  "ocaml",
  "pascal",
  "pawn",
  "perl",
  "php",
  "postcss",
  "powershell",
  "prettier",
  "prisma",
  "pug",
  "purescript",
  "python",
  "r",
  "README.md",
  "reasonml",
  "ruby",
  "rust",
  "scala",
  "scss",
  "shell",
  "sql",
  "stylus",
  "svg",
  "swift",
  "tex",
  "text",
  "toml",
  "travis",
  "ts",
  "tsx",
  "twig",
  "txt",
  "typescript-def",
  "vb",
  "vba",
  "vcxproj",
  "vscode-big",
  "vscode-insiders",
  "vscode",
  "vscodeignore",
  "vue",
  "wasm",
  "webpack",
  "xml",
  "yaml",
  "yarn",
})

local M = {}
for _, item in ipairs(wrapped) do
  for lang, info in pairs(item) do
    M[lang] = info
  end
end

M["md"] = {
  "Markdown",
  "https://raw.githubusercontent.com/smokes/vscode-discord-assets/master/markdown.png",
}
M["README.md"] = {
  "Markdown",
  "https://raw.githubusercontent.com/dharmx/lambda-wallpapers/main/devicons/README.md.png",
}
M["[packer]"] = {
  "PackerStatus",
  "https://raw.githubusercontent.com/dharmx/lambda-wallpapers/main/devicons/packer.png",
}
M["NvimTree_1"] = {
  "NvimTree",
  "https://raw.githubusercontent.com/dharmx/lambda-wallpapers/main/devicons/nvimtree.png",
}
M["Python"] = {
  "Python",
  "https://raw.githubusercontent.com/dharmx/lambda-wallpapers/main/devicons/python.png",
}
M["py"] = {
  "Python",
  "https://raw.githubusercontent.com/smokes/vscode-discord-assets/master/python.png",
}
M["yuck"] = {
  "Yuck",
  "https://raw.githubusercontent.com/dharmx/lambda-wallpapers/main/devicons/yuck.png",
}
M["zsh"] = {
  "Zsh",
  "https://raw.githubusercontent.com/smokes/vscode-discord-assets/master/shell.png",
}
M["Bash"] = {
  "Bash",
  "https://raw.githubusercontent.com/smokes/vscode-discord-assets/master/shell.png",
}
M["Fish"] = {
  "Fish",
  "https://raw.githubusercontent.com/smokes/vscode-discord-assets/master/shell.png",
}
M["sh"] = {
  "Sh",
  "https://raw.githubusercontent.com/smokes/vscode-discord-assets/master/shell.png",
}

return M
