local MainConfig = require("dharmx")

vim.g.undotree_WindowLayout = 4
vim.g.undotree_ShortIndicators = 0
vim.g.undotree_DiffpanelHeight = 10
vim.g.undotree_DiffAutoOpen = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_SplitWidth = 40
vim.g.undotree_TreeNodeShape = MainConfig.ui.undo.TreeNodeShape
vim.g.undotree_TreeVertShape = MainConfig.ui.undo.TreeVertShape
vim.g.undotree_TreeSplitShape = MainConfig.ui.undo.TreeSplitShape
vim.g.undotree_TreeReturnShape = MainConfig.ui.undo.TreeReturnShape
vim.g.undotree_DiffCommand = "diff"
vim.g.undotree_RelativeTimestamp = 1
vim.g.undotree_HighlightChangedText = 1
vim.g.undotree_HighlightChangedWithSign = 1
vim.g.undotree_HighlightSyntaxAdd = "DiffAdd"
vim.g.undotree_HighlightSyntaxChange = "DiffChange"
vim.g.undotree_HighlightSyntaxDel = "DiffDelete"
vim.g.undotree_HelpLine = 1
vim.g.undotree_CursorLine = 1

-- vim:filetype=lua
