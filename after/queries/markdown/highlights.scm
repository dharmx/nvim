;; extends

((task_list_marker_unchecked) @markdown.check.undone (#set! conceal ""))
((task_list_marker_checked) @markdown.check.done (#set! conceal ""))

((atx_h1_marker) @markdown.h1.marker (#set! conceal ""))
((atx_h2_marker) @markdown.h2.marker (#set! conceal "▐"))
((atx_h3_marker) @markdown.h3.marker (#set! conceal "▐"))
((atx_h4_marker) @markdown.h4.marker (#set! conceal "▐"))

(([(list_marker_star) (list_marker_plus) (list_marker_minus) ]) @markdown.list.marker
  (#offset! @markdown.list.marker 0 0 0 -1)
  (#set! conceal "•"))

(pipe_table_header ("|") @punctuation.special @conceal (#set! conceal "│"))
(pipe_table_delimiter_row ("|") @punctuation.special @conceal (#set! conceal "│"))
(pipe_table_delimiter_cell ("-") @punctuation.special @conceal (#set! conceal "─"))
(pipe_table_row ("|") @punctuation.special @conceal (#set! conceal "│"))

((block_quote_marker) @markdown.quote.marker (#set! conceal "▍"))
((block_quote
  (paragraph (inline
    (block_continuation) @markdown.quote.marker (#set! conceal "▍")))))

(fenced_code_block (fenced_code_block_delimiter) @markdown.code_block.marker
  (#set! conceal ""))

([(info_string (language))] @markdown.code_block.lang.javascript
  (#eq? @markdown.code_block.lang.javascript "javascript")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.typescript
  (#eq? @markdown.code_block.lang.typescript "typescript")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.json
  (#eq? @markdown.code_block.lang.json "json")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.bash
  (#eq? @markdown.code_block.lang.bash "bash")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.bash
  (#eq? @markdown.code_block.lang.bash "sh")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.lua
  (#eq? @markdown.code_block.lang.lua "lua")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.diff
  (#eq? @markdown.code_block.lang.diff "diff")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.vim
  (#eq? @markdown.code_block.lang.vim "vim")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.yaml
  (#eq? @markdown.code_block.lang.yaml "yaml")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.java
  (#eq? @markdown.code_block.lang.java "java")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.html
  (#eq? @markdown.code_block.lang.html "html")
  (#set! conceal ""))
([(info_string (language))] @markdown.code_block.lang.css
  (#eq? @markdown.code_block.lang.css "css")
  (#set! conceal ""))
( [(info_string (language))] @markdown.code_block.lang.sql
  (#eq? @markdown.code_block.lang.sql "sql")
  (#set! conceal ""))
