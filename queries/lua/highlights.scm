;; Keywords
(("local"    @keyword) (#set! conceal ""))
(("function" @keyword) (#set! conceal "ﬦ"))

;; Function names
((function_call name: (identifier) @function (#eq? @function "require")) (#set! conceal ""))
((function_call name: (identifier) @function (#eq? @function "print"  )) (#set! conceal "朗"))

;; vim.*
(((dot_index_expression) @keyword (#eq? @keyword "vim.cmd"     )) (#set! conceal ""))
(((dot_index_expression) @keyword (#eq? @keyword "vim.api"     )) (#set! conceal ""))
(((dot_index_expression) @keyword (#eq? @keyword "vim.fn"      )) (#set! conceal "#"))
(((dot_index_expression) @keyword (#eq? @keyword "vim.g"       )) (#set! conceal ""))
(((dot_index_expression) @keyword (#eq? @keyword "vim.o"       )) (#set! conceal ""))
