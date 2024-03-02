" Radium
" A radioactive colorscheme.
" Authored by: https://github.com/dharmx
" License: GPL-3.0

" GNU GENERAL PUBLIC LICENSE
" Version 3, 29 June 2007
"
" Permissions of this strong copyleft license are conditioned on
" making available complete source code of licensed works and
" modifications, which include larger works using a licensed work,
" under the same license. Copyright and license notices must be
" preserved. Contributors provide an express grant of patent rights.
"
" Read the complete license here: https://www.gnu.org/licenses/gpl-3.0.en.html

set encoding=UTF-8
let g:colors_name = 'radium'
set background=dark

let g:terminal_color_0 = '#181C24                                                                                                                                                                                               '
let g:terminal_color_1 = '#F87070'
let g:terminal_color_2 = '#79DCAA'
let g:terminal_color_3 = '#FFE59E'
let g:terminal_color_4 = '#7AB0DF'
let g:terminal_color_5 = '#C397D8'
let g:terminal_color_6 = '#70C0BA'
let g:terminal_color_7 = '#D4D4D5'
let g:terminal_color_8 = '#1C2228'
let g:terminal_color_9 = '#FB7373'
let g:terminal_color_10 = '#36C692'
let g:terminal_color_11 = '#FCCF67'
let g:terminal_color_12 = '#5FB0FC'
let g:terminal_color_13 = '#B77EE0'
let g:terminal_color_14 = '#54CED6'
let g:terminal_color_15 = '#FFFFFF'

let $FZF_DEFAULT_OPTS = "
 \  --color=border:#161B20,preview-bg:#161B20
 \  --color='scrollbar:#24292E,gutter:#161B20'
 \  --color='bg+:#24292E,fg+:#D4D4D5,spinner:#79DCAA'
 \  --color='pointer:#C397D8,marker:#F87070'
 \  --color='info:#70C0BA,bg:#11161B'
 \  --scrollbar='░'
 \  --border='none'
 \  --separator='▓'
 \  --marker=' '
 \  --ellipsis='… '
 \  --prompt='ﭑ '
 \  --pointer=' λ'
 \  --layout=reverse
 \  --bind='ctrl-v:execute(nvim {}),shift-up:preview-page-up,shift-down:preview-page-down'
 \  --cycle
 \  --height=40
 \  --color='border:#161B20,preview-bg:#161B20'
 \  --color='scrollbar:#24292E,gutter:#161B20'
 \  --color='bg+:#24292E,fg+:#D4D4D5,spinner:#79DCAA'
 \  --color='pointer:#C397D8,marker:#F87070'
 \  --color='info:#70C0BA,bg:#11161B'
 \  --scrollbar='░'
 \  --border='none'
 \  --separator='▓'
 \  --marker=' '
 \  --ellipsis='… '
 \  --prompt='ﭑ '
 \  --pointer=' λ'
 \  --layout=reverse
 \  --bind='ctrl-v:execute(nvim {}),shift-up:preview-page-up,shift-down:preview-page-down'
 \  --cycle
 \  --height=40
 \  --color='border:#161B20,preview-bg:#161B20'
 \  --color='scrollbar:#24292E,gutter:#161B20'
 \  --color='bg+:#24292E,fg+:#D4D4D5,spinner:#79DCAA'
 \  --color='pointer:#C397D8,marker:#F87070'
 \  --color='info:#70C0BA,bg:#11161B'
 \  --scrollbar='░'
 \  --border='none'
 \  --separator='▓'
 \  --marker=' '
 \  --ellipsis='… '
 \  --prompt='ﭑ '
 \  --pointer=' λ'
 \  --layout=reverse
 \  --bind='ctrl-v:execute(nvim {}),shift-up:preview-page-up,shift-down:preview-page-down'
 \  --cycle
 \  --height=40"

hi Title gui=bold guifg=#66b3ff
hi LazyProp guibg=#151a1f guifg=#5FB0FC
hi AlphaButtonLabelText guifg=#FFE59E
hi AlphaFooting gui=bold guifg=#C397D8
hi AlphaHeading guifg=#1A1F25
hi AlphaKeyPrefix guibg=#7AB0DF gui=bold guifg=#101317
hi AlphaLoaded guifg=#24292F
hi AlphaScroll guifg=#C397D8
hi Bold gui=bold
hi BookmarkAnnotationLine guifg=#DDB1F2
hi BookmarkAnnotationSign guifg=#C397D8
hi BookmarkLine guibg=#31363B
hi BookmarkSign guifg=#F87070
hi Boolean gui=bold guifg=#F87070
hi BufferLineBackground guibg=#14171E guifg=#242A36
hi BufferLineBuffer guibg=#14171E guifg=#14171E
hi BufferLineBufferSelected guibg=#7AB0DF gui=bold guifg=#101317
hi BufferLineBufferVisible guibg=#14171E guifg=#7AB0DF
hi BufferLineCloseButton guibg=#14171E guifg=#F87070
hi BufferLinecloseButtonSelected guibg=#7AB0DF guifg=#101317
hi BufferLineCloseButtonVisible guibg=#14171E guifg=#F87070
hi BufferLineDuplicate guibg=#14171E guifg=#242A36
hi BufferLineDuplicateSelected guibg=#14171E guifg=#242A36
hi BufferLineDuplicateVisible guibg=#14171E guifg=#242A36
hi BufferLineFill guibg=#101317 guifg=#313743
hi BufferLineIndicatorSelected guibg=#7AB0DF guifg=#7AB0DF
hi BufferLineIndicatorVisible guibg=#14171E guifg=#14171E
hi BufferLineModified guibg=#14171E guifg=#79DCAA
hi BufferLineModifiedSelected guibg=#7AB0DF guifg=#101317
hi BufferLineModifiedVisible guibg=#14171E guifg=#79DCAA
hi BufferLineOffsetSeparator guibg=#7AB0DF guifg=#7AB0DF
hi BufferLinePick guibg=#14171E gui=bold guifg=#D997C8
hi BufferLinePickSelected guibg=#7AB0DF gui=bold guifg=#E6CFA1
hi BufferLinePickVisible guibg=#14171E gui=bold guifg=#FCCF67
hi BufferLineSeparator guibg=#14171E guifg=#14171E
hi BufferLineSeparatorSelected guibg=#7AB0DF guifg=#7AB0DF
hi BufferLineSeparatorVisible guibg=#14171E guifg=#14171E
hi BufferLineTabClose guibg=#101317 guifg=#F87070
hi BufferLineTab guibg=#14171E guifg=#242A36
hi BufferLineTabSelected guibg=#101317 gui=bold guifg=#7AB0DF
hi BufferLineTabSeparator guibg=#14171E guifg=#14171E
hi BufferLineTabSeparatorSelected guifg=#101317
hi Character guifg=#E1C58D
hi CmpItemAbbrDeprecated guifg=#3E4450
hi CmpItemAbbr guifg=#BABABE
hi CmpItemAbbrMatchFuzzy guifg=#FCCF67
hi CmpItemAbbrMatch guifg=#79DCAA
hi CmpItemKindClass guifg=#F87070
hi CmpItemKindColor guifg=#7AB0DF
hi CmpItemKindConstant guifg=#FF6666
hi CmpItemKindConstructor guifg=#5FB0FC
hi CmpItemKindEnum guifg=#54CED6
hi CmpItemKindEnumMember guifg=#C297B9
hi CmpItemKindEvent guifg=#7AAFF3
hi CmpItemKindField guifg=#FFE69F
hi CmpItemKindFile guifg=#FCCF67
hi CmpItemKindFolder guifg=#FCCF67
hi CmpItemKindFunction guifg=#BE8FD7
hi CmpItemKind guifg=#3E4450
hi CmpItemKindInterface guifg=#C397D8
hi CmpItemKindKeyword guifg=#66B3FF
hi CmpItemKindMethod guifg=#DC7272
hi CmpItemKindModule guifg=#5FB0FC
hi CmpItemKindOperator guifg=#70C0BA
hi CmpItemKindProperty guifg=#54CED6
hi CmpItemKindReference guifg=#FB7373
hi CmpItemKindSnippet guifg=#FFE59E
hi CmpItemKindStruct guifg=#5FB0FC
hi CmpItemKindText guifg=#5FB0FC
hi CmpItemKindTypeParameter guifg=#FFE49D
hi CmpItemKindUnit guifg=#54CED6
hi CmpItemKindValue guifg=#79DCAA
hi CmpItemKindVariable guifg=#36C692
hi CmpItemMenu guifg=#7AB0DF
hi ColorColumn guibg=#111419 guifg=#171A20
hi Comment guifg=#515C68
hi Conceal guifg=#353E47 guibg=NONE
hi Conditional guifg=#F87070
hi Constant guifg=#FF6666
hi CursorColumn guibg=#191D21
hi Cursor guibg=#DFC184 guifg=#101317
hi CursorLineFold guibg=#101317 guifg=#70C0BA
hi CursorLine guibg=#191D21
hi CursorLineNr gui=bold guifg=#FFE59E
hi CursorLineSign guibg=#101317
hi Debug guifg=#FB7373
hi Decorator guifg=#FFE59E
hi Define guifg=#C397D8
hi Delimeter guifg=#7AB0DF
hi Delimiter guifg=#FB7373
hi DiagnosticError guifg=#F87070
hi DiagnosticFloatingError guifg=#F87070
hi DiagnosticFloatingHint guifg=#C397D8
hi DiagnosticFloatingInfo guifg=#7AB0DF
hi DiagnosticFloatingWarn guifg=#F97F7F
hi DiagnosticHint guifg=#C397D8
hi DiagnosticInfo guifg=#7AB0DF
hi DiagnosticSignError guifg=#FB7373
hi DiagnosticSignHint guifg=#C397D8
hi DiagnosticSignInfo guifg=#7AB0DF
hi DiagnosticSignWarn guifg=#F97F7F
hi DiagnosticUnderlineError guifg=#F87070
hi DiagnosticUnderlineHint guifg=#C397D8
hi DiagnosticUnderlineInfo guifg=#7AB0DF
hi DiagnosticUnderlineWarn guifg=#F97F7F
hi DiagnosticVirtualTextError guifg=#F87070
hi DiagnosticVirtualTextHint guifg=#C397D8
hi DiagnosticVirtualTextInfo guifg=#7AB0DF
hi DiagnosticVirtualTextWarn guifg=#F97F7F
hi DiagnosticWarn guifg=#F97F7F
hi DiffAdd guifg=#79DCAA gui=reverse
hi DiffChange guifg=#C397D8 gui=reverse
hi DiffDelete guifg=#F87070 gui=reverse
hi DiffText guifg=#7AB0DF gui=reverse
hi DiffviewCursorLine guibg=#191D21
hi DiffviewDiffAddAsDelete guifg=#F87070 gui=reverse
hi DiffviewDiffDelete guifg=#515C68
hi DiffviewDim1 guifg=#515C68
hi DiffviewEndOfBuffer guifg=#C397D8
hi DiffviewFilePanelConflicts guifg=#F97F7F
hi DiffviewFilePanelCounter gui=bold guifg=#36C692
hi DiffviewFilePanelFileName guifg=#D4D4D5
hi DiffviewFilePanelPath guifg=#515C68
hi DiffviewFilePanelRootPath gui=bold guifg=#F87070
hi DiffviewFilePanelSelected guifg=#F87070
hi DiffviewFilePanelTitle gui=bold guifg=#F87070
hi DiffviewFolderName guifg=#FFE59E
hi DiffviewFolderSign guifg=#F96262
hi DiffviewNonText guifg=#222931
hi DiffviewNormal guibg=#101317 guifg=#D4D4D5
hi DiffviewPrimary guifg=#BE8FD7
hi DiffviewReference guifg=#BE8FD7
hi DiffviewSecondary guifg=#79DCAA
hi DiffviewSignColumn guibg=#101317 guifg=#D4D4D5
hi DiffviewStatusIgnored guifg=#515C68
hi DiffviewStatusLine guibg=#101317 guifg=#7AB0DF
hi DiffviewStatusLineNC guifg=#7AB0DF
hi DiffviewWinSeparator guifg=#171C21
hi Directory guifg=#FFE59E
hi EndOfBuffer guifg=#C397D8
hi Error guifg=#F76262 guibg=NONE
hi ErrorMsg guifg=#F87070 guibg=#151A1F
hi Exception guifg=#36C692
hi FidgetTask guifg=#1A1E27
hi FidgetTitle gui=bold guifg=#36C692
hi FloatBorder guibg=#151A1F guifg=#151A1F
hi Float guifg=#F3A4F1
hi FloatShadow guibg=#000000 blend=80
hi FloatShadowThrough guibg=#000000 blend=100
hi FocusedSymbol guibg=#666666 guifg=#FFA0A0
hi FoldColumn guibg=#101317 guifg=#70C0BA
hi Folded guibg=#101317 guifg=#282F3C
hi Function guifg=#BE8FD7
hi GitSignsAdd guifg=#7AB0DF
hi GitSignsAddInline gui=reverse
hi GitSignsAddLn guifg=#7AB0DF
hi GitSignsAddLnInline gui=reverse
hi GitSignsAddNr guifg=#5FB0FC
hi GitSignsAddPreview guifg=#79DCAA gui=reverse
hi GitSignsChangedelete guifg=#21272D
hi GitSignsChangedeleteLn guifg=#CB9FE0
hi GitSignsChangedeleteNr guifg=#B77EE0
hi GitSignsChange guifg=#21272D
hi GitSignsChangeInline gui=reverse
hi GitSignsChangeLn guifg=#CB9FE0
hi GitSignsChangeLnInline gui=reverse
hi GitSignsChangeNr guifg=#B77EE0
hi GitSignsCurrentLineBlame guifg=#222931
hi GitSignsDelete guifg=#FB7373
hi GitSignsDeleteInline gui=reverse
hi GitSignsDeleteLn guifg=#F87070
hi GitSignsDeleteLnInline gui=reverse
hi GitSignsDeleteNr guifg=#FE7676
hi GitSignsDeletePreview guifg=#F87070 gui=reverse
hi GitSignsDeleteVirtLn guifg=#F87070 gui=reverse
hi GitSignsDeleteVirtLnInLine gui=reverse
hi GitSignsStagedAdd guifg=#3D586F
hi GitSignsStagedAddLn guifg=#3D586F
hi GitSignsStagedAddNr guifg=#2F587E
hi GitSignsStagedChangedelete guifg=#101316
hi GitSignsStagedChangedeleteLn guifg=#654F70
hi GitSignsStagedChangedeleteNr guifg=#5B3F70
hi GitSignsStagedChange guifg=#101316
hi GitSignsStagedChangeLn guifg=#654F70
hi GitSignsStagedChangeNr guifg=#5B3F70
hi GitSignsStagedDelete guifg=#7D3939
hi GitSignsStagedDeleteLn guifg=#7C3838
hi GitSignsStagedDeleteNr guifg=#7F3B3B
hi GitSignsStagedTopdelete guifg=#7D3939
hi GitSignsStagedTopdeleteNr guifg=#7F3B3B
hi GitSignsTopdelete guifg=#FB7373
hi GitSignsTopdeleteNr guifg=#FE7676
hi GitSignsUntracked guifg=#7AB0DF
hi GitSignsUntrackedLn guifg=#7AB0DF
hi GitSignsUntrackedNr guifg=#5FB0FC
hi HarpoonBorder guibg=#151A1F guifg=#151A1F
hi HarpoonCurrentFile gui=bold guifg=#FFE59E
hi HarpoonCursor guibg=#1A1F25 guifg=#7AB0DF
hi HarpoonTitle guibg=#F87070 guifg=#171C21
hi HarpoonWindow guibg=#151A1F guifg=#BABABE
hi HighlightUrl guifg=#70C0BA gui=underline
hi HlSearchFloat guibg=#1A1E27 guifg=#D0A4E5
hi HlSearchLens guibg=#1A1E27 guifg=#87BDEC
hi HlSearchLensNear guibg=#FFE28F gui=bold guifg=#101317
hi HlSearchNear guibg=#1A1E27 gui=bold guifg=#7DCDC7
hi Identifier guifg=#36C692
hi InclineBG guibg=#171C21
hi InclineBGNC guibg=#14171E
hi InclineCursorLine guibg=#151A1F
hi InclineCursorLineNC guibg=#141A1D
hi InclineFG guifg=#D4D4D5
hi InclineFGNC guifg=#C397D8
hi InclineNormal guibg=#151A1F guifg=#BABABE
hi InclineNormalNC guibg=#151A1F guifg=#BABABE
hi InclineThemeBG guibg=#FFE59E
hi Include gui=bold guifg=#6AA6DF
hi IncSearch guibg=#70C0BA guifg=#101317
hi IndentBlanklineChar guifg=#22272C
hi IndentBlanklineContextChar guifg=#7AB0DF
hi IndentBlanklineContextStart guibg=#16191F
hi Italic gui=italic
hi JaqBorder guibg=#161921
hi JaqWin guibg=#161921
hi Keyword guifg=#66B3FF
hi Label guifg=#F87070
hi LightBulbFloatWin guifg=#FCCF67
hi LightBulbSign guifg=#FFE59E
hi LightBulbVirtualText guifg=#FFE59E
hi LineNrAbove guifg=#2E3645
hi LineNrBelow guifg=#2E3645
hi LineNr guifg=#2E3645
hi LspDiagnosticsSignError guifg=#FB7373
hi LspDiagnosticsSignHint guifg=#C397D8
hi LspDiagnosticsSignInfo guifg=#7AB0DF
hi LspDiagnosticsSignWarn guifg=#FF7D7D
hi LspReferenceRead guibg=#161921 gui=bold guifg=#82B8E7
hi LspReferenceText guibg=#161921 gui=bold guifg=#CB9FE0
hi LspReferenceWrite guibg=#161921 gui=bold guifg=#DC97CA
hi LspSignatureActiveParameter guibg=#161921 gui=bold guifg=#78C8C2
hi luaCommentDelimiter guifg=#515C68
hi luaComment guifg=#515C68
hi luaCondElse guifg=#F87070
hi luaCond guifg=#F87070
hi luaConstant guifg=#FF6666
hi luaError guifg=#F76262
hi luaFor guifg=#B77EE0
hi luaFunc guifg=#36C692
hi luaFunction guifg=#BE8FD7
hi luaLabel guifg=#F87070
hi luaMetaMethod guifg=#BE8FD7
hi luaNumber guifg=#54CED6
hi luaOperator guifg=#70C0BA
hi luaParenError guifg=#F76262
hi luaRepeat guifg=#B77EE0
hi luaSpecial guifg=#C397D8
hi luaStatement guifg=#F87070
hi luaString2 guifg=#79DCAA
hi luaStringDelimiter guifg=#79DCAA
hi luaString guifg=#79DCAA
hi luaSymbolOperator guifg=#70C0BA
hi luaTable guifg=#5FB0FC
hi Macro guifg=#F98989
hi MatchBackground guibg=#111419 guifg=#171A20
hi MatchParenCur guibg=#202530 gui=bold
hi MatchParen guibg=#202530 gui=bold
hi MatchWord guibg=#202530 gui=bold
hi ModeMsg gui=bold guifg=#7AB0DF
hi monarkCommand guifg=#5FB0FC
hi monarkInsert guifg=#7AB0DF
hi monarkNormal guifg=#79DCAA
hi monarkReplace guifg=#C397D8
hi MonarkSelect guifg=#54CED6
hi MonarkTerminal guifg=#54CED6
hi MonarkVisualBlock guifg=#FCCF67
hi monarkVisual guifg=#FFE59E
hi MonarkVisualLine guifg=#F87070
hi MoreMsg guifg=#FFE59E
hi MsgArea guifg=#CACACD
hi MsgSeparator guifg=#C397D8
hi NavicIconsArray guifg=#FCCF67
hi NavicIconsBoolean gui=bold guifg=#F87070
hi NavicIconsClass guifg=#F75858
hi NavicIconsConstant gui=bold guifg=#FF6666
hi NavicIconsConstructor guifg=#5FB0FC
hi NavicIconsEnum guifg=#7AB0DF
hi NavicIconsEnumMember guifg=#F96262
hi NavicIconsEvent guifg=#79CFAA
hi NavicIconsField guifg=#36C692
hi NavicIconsFile guifg=#FFE59E
hi NavicIconsFunction guifg=#BE8FD7
hi NavicIconsInterface guifg=#FF7070
hi NavicIconsKey guifg=#F87070
hi NavicIconsMethod guifg=#B77EE0
hi NavicIconsModule guifg=#F98989
hi NavicIconsNull gui=bold guifg=#FFDF85
hi NavicIconsNumber guifg=#54CED6
hi NavicIconsObject guifg=#FFE390
hi NavicIconsOperator guifg=#70C0BA
hi NavicIconsPackage gui=bold guifg=#6AA6DF
hi NavicIconsProperty guifg=#54CED6
hi NavicIconsString guifg=#79DCAA
hi NavicIconsStruct guifg=#5FB0FC
hi NavicIconsTypeParameter guifg=#FFE49D
hi NavicIconsVariable gui=bold guifg=#FA6969
hi NavicSeparator guifg=#7AB0DF
hi NavicText guifg=#AAAAAF
hi NeogitBranch gui=bold guifg=#36C692
hi NeogitCommitViewHeader guibg=#7AB0DF gui=bold guifg=#101317
hi NeogitDiffAdd guibg=#16191D guifg=#7AB0DF
hi NeogitDiffContextHighlight guibg=#1A1D24
hi NeogitDiffDelete guibg=#1C1F22 guifg=#F87070
hi NeogitFilePath guifg=#70C0BA
hi NeogitFold guifg=#54CED6
hi NeogitHunkHeader guibg=#171C21 guifg=#FFE59E
hi NeogitHunkHeaderHighlight guibg=#FFE59E guifg=#101317
hi NeogitNotificationError guibg=#101317 guifg=#F87070
hi NeogitNotificationInfo guibg=#101317 guifg=#7AB0DF
hi NeogitNotificationWarning guibg=#101317 guifg=#FFE59E
hi NeogitObjectId guifg=#C397D8
hi NeogitRebaseDone gui=bold guifg=#79DCAA
hi NeogitRebasing gui=bold guifg=#FFE59E
hi NeogitRecentcommits gui=bold guifg=#79DCAA
hi NeogitRemote gui=bold guifg=#FCCF67
hi NeogitStagedchanges gui=bold guifg=#FFE59E
hi NeogitStashes gui=bold guifg=#70C0BA
hi NeogitStash guifg=#70C0BA
hi NeogitUnmergedchanges gui=bold guifg=#36C692
hi NeogitUnmergedInto guifg=#7AB0DF
hi NeogitUnpulledchanges gui=bold guifg=#54CED6
hi NeogitUnpulledFrom guifg=#54CED6
hi NeogitUnstagedchanges gui=bold guifg=#FB7373
hi NeogitUntrackedfiles gui=bold guifg=#5FB0FC
hi NonText guifg=#222931
hi NormalFloat guibg=#151A1F guifg=#BABABE
hi Normal guibg=#101317 guifg=#D4D4D5
hi NotifyBackground guibg=#101317 guifg=#D4D4D5
hi NotifyDEBUGBody guibg=#171C21 guifg=#C397D8
hi NotifyDEBUGBorder guibg=#171C21 guifg=#171C21
hi NotifyDEBUGIcon guibg=#171C21 guifg=#B77EE0
hi NotifyDEBUGTitle guibg=#171C21 guifg=#C397D8
hi NotifyERRORBody guibg=#171C21 guifg=#F87070
hi NotifyERRORBorder guibg=#171C21 guifg=#171C21
hi NotifyERRORIcon guibg=#171C21 guifg=#FB7373
hi NotifyERRORTitle guibg=#171C21 guifg=#F87070
hi NotifyINFOBody guibg=#171C21 guifg=#7AB0DF
hi NotifyINFOBorder guibg=#171C21 guifg=#171C21
hi NotifyINFOIcon guibg=#171C21 guifg=#5FB0FC
hi NotifyINFOTitle guibg=#171C21 guifg=#7AB0DF
hi NotifyLogTime guifg=#515C68
hi NotifyLogTitle guifg=#FB7373
hi NotifyTRACEBody guibg=#171C21 guifg=#79DCAA
hi NotifyTRACEBorder guibg=#171C21 guifg=#171C21
hi NotifyTRACEIcon guibg=#171C21 guifg=#36C692
hi NotifyTRACETitle guibg=#171C21 guifg=#79DCAA
hi NotifyWARNBody guibg=#171C21 guifg=#FFE59E
hi NotifyWARNBorder guibg=#171C21 guifg=#171C21
hi NotifyWARNIcon guibg=#171C21 guifg=#FCCF67
hi NotifyWARNTitle guibg=#171C21 guifg=#FFE59E
hi NUICancel guifg=#222931
hi NUIHeading guibg=#151A1F guifg=#F87070
hi NUILine guibg=#151A1F guifg=#22272C
hi NUINo guifg=#F87070
hi NUINormal guibg=#151A1F guifg=#151A1F
hi NUIPrompt guibg=#151A1F guifg=#7AB0DF
hi NUIText guibg=#151A1F guifg=#BABABE
hi NUIYes guifg=#7AB0DF
hi Number guifg=#54CED6
hi NvimTreeBookmark guifg=#FFE59E
hi NvimTreeClosedFolderIcon guifg=#B77EE0
hi NvimTreeCursorLine guifg=#12151B
hi NvimTreeCursorLineNr gui=bold guifg=#36C692
hi NvimTreeEmptyFolderName guifg=#B58ED1
hi NvimTreeExecFile guifg=#D997C8
hi NvimTreeFileDeleted guifg=#FB7373
hi NvimTreeFileDirty guifg=#70C0BA
hi NvimTreeFileIgnored guifg=#171C21
hi NvimTreeFileMerge guifg=#36C692
hi NvimTreeFileNew guifg=#FFE59E
hi NvimTreeFileRenamed guifg=#5FB0FC
hi NvimTreeFileStaged guifg=#D997C8
hi NvimTreeFolderIcon guifg=#B77EE0
hi NvimTreeFolderName guifg=#B77EE0
hi NvimTreeGitDeleted guifg=#F87070
hi NvimTreeGitDirty guifg=#70C0BA
hi NvimTreeGitIgnored guifg=#171C21
hi NvimTreeGitMerge guifg=#54CED6
hi NvimTreeGitNew guifg=#FFE59E
hi NvimTreeGitRenamed guifg=#5FB0FC
hi NvimTreeGitStaged guifg=#D997C8
hi NvimTreeImageFile guifg=#B77EE0
hi NvimTreeIndentMarker guifg=#1D2529
hi NvimTreeNormal guibg=#0C0E11 guifg=#BABABE
hi NvimTreeNormalNC guibg=#0C0E11 guifg=#BABABE
hi NvimTreePopup guifg=#7AB0DF
hi NvimTreeRootFolder gui=bold guifg=#F87070
hi NvimTreeSymlink guifg=#70C0BA
hi NvimTreeVertSplit guibg=#0C0E11 guifg=#0C0E11
hi NvimTreeWindowPicker guibg=#191C24 guifg=#7AB0DF
hi NvimTreeWinSeparator guibg=#0C0E11 guifg=#0C0E11
hi NvimUnaryMinus guifg=#70C0BA
hi NvimUnaryOperator guifg=#70C0BA
hi NvimUnaryPlus guifg=#70C0BA
hi Operator guifg=#70C0BA
hi Pmenu guibg=#171D20 guifg=#A0A0A5
hi PmenuSbar guibg=#171D20 guifg=#A0A0A5
hi PmenuSel guibg=#1B2226 guifg=#ADADB2
hi PmenuThumb guibg=#1E2225
hi PreCondit guifg=#F96262
hi PreProc guifg=#F96262
hi Question guifg=#79DCAA
hi QuickFixLine guibg=#FFE59E guifg=#101317
hi TSRainbowBlue guifg=#94CAF9
hi TSRainbowCyan guifg=#79CAFF
hi TSRainbowGreen guifg=#50E0AC
hi TSRainbowOrange guifg=#FF9393 
hi TSRainbowRed guifg=#F96262
hi TSRainbowViolet guifg=#D098FF
hi TSRainbowYellow guifg=#FFE981
hi RedrawDebugClear guibg=#FFFF00
hi RedrawDebugComposed guibg=#008000
hi RedrawDebugNormal gui=reverse
hi RedrawDebugRecompose guibg=#FF0000
hi Repeat guifg=#B77EE0
hi RnvimrCurses guibg=#101317 guifg=#D4D4D5
hi RnvimrNormal guibg=#151A1F guifg=#BABABE
hi ScrollbarCursor guifg=#54CED6
hi ScrollbarCursorHandle guibg=#20272E guifg=#54CED6
hi ScrollbarError guifg=#F87070
hi ScrollbarErrorHandle guifg=#F87070
hi ScrollbarGitAdd guifg=#7AB0DF
hi ScrollbarGitAddHandle guifg=#82B8E7
hi ScrollbarGitChange guifg=#C397D8
hi ScrollbarGitChangeHandle guifg=#BD84E6
hi ScrollbarGitDelete guifg=#F87070
hi ScrollbarGitDeleteHandle guifg=#FF7B7B
hi ScrollbarHandle guifg=#7AB0DF
hi ScrollbarHint guifg=#C397D8
hi ScrollbarHintHandle guifg=#B77EE0
hi ScrollbarInfo guifg=#7AB0DF
hi ScrollbarInfoHandle guifg=#7AB0DF
hi ScrollbarMisc guifg=#DC97CA
hi ScrollbarMiscHandle guifg=#70C0BA
hi ScrollbarSearch guifg=#FFE59E
hi ScrollbarSearchHandle guifg=#FFD76F
hi ScrollbarWarn guifg=#F97F7F
hi ScrollbarWarnHandle guifg=#FA6969
hi Search guibg=#FFE59E guifg=#101317
hi SignColumn guibg=#101317
hi SpecialChar guifg=#C397D8
hi SpecialComment guifg=#FFDF8F
hi Special guifg=#FB7373
hi SpecialKey gui=bold guifg=#FFE59E
hi SpellBad guifg=#F87070
hi SpellCap guifg=#FCCF67
hi SpellLocal guifg=#FB7373
hi SpellRare guifg=#54CED6
hi Statement guifg=#F87070
hi StatusLine guifg=#191D21 guibg=#7AB0DF
hi StatusLineNC guifg=#7AB0DF guibg=#101317
hi StorageClass guifg=#F75858
hi String guifg=#79DCAA
hi Structure guifg=#5FB0FC
hi Substitute guibg=#B77EE0 guifg=#101317
hi TabLine guibg=#101317 gui=bold guifg=#2C3640
hi TabLineFill guifg=#101317 guibg=#7AB0DF
hi TabLineSel guibg=#7AB0DF gui=bold guifg=#101317
hi Tag guifg=#7AB0DF
hi TelescopeMatching gui=bold guifg=#DC97CA
hi TelescopePreviewBorder guibg=#0E1014 guifg=#0E1014
hi TelescopePreviewLine guibg=#15181E
hi TelescopePreviewNormal guibg=#0E1014 guifg=#BABABE
hi TelescopePreviewTitle guibg=#7AB0DF guifg=#101317
hi TelescopePromptBorder guibg=#12151B guifg=#14191D
hi TelescopePromptCounter guibg=#12151B gui=bold guifg=#D997C8
hi TelescopePromptNormal guibg=#12151B guifg=#BABABE
hi TelescopePromptPrefix guibg=#12151B guifg=#F87070
hi TelescopePromptTitle guibg=#F87070 guifg=#101317
hi TelescopePromptBorder guibg=#12151B guifg=#2E7DC2
hi TelescopeResultsBorder guibg=#0C0E11 guifg=#0C0E11
hi TelescopeResultsNormal guibg=#0C0E11 guifg=#BABABE
hi TelescopeResultsTitle guibg=#79DCAA guifg=#101317
hi TelescopeSelectionCaret guibg=#101317 guifg=#FB7373
hi TelescopeSelection guibg=#101317 guifg=#54CED6
hi TermCursor gui=reverse
hi TodoBgBUG guibg=#F87070 gui=bold guifg=#171C21
hi TodoBgCHORE guibg=#70C0BA gui=bold guifg=#171C21
hi TodoBgCLEAN guibg=#7AB0DF gui=bold guifg=#171C21
hi TodoBgDEMO guibg=#5FB0FC gui=bold guifg=#171C21
hi TodoBgFIX guibg=#FFE59E gui=bold guifg=#171C21
hi TodoBgHACK guibg=#79DCAA gui=bold guifg=#171C21
hi TodoBgIMPROVE guibg=#5FB0FC gui=bold guifg=#171C21
hi TodoBgNOTE guibg=#36C692 gui=bold guifg=#171C21
hi TodoBgPERF guibg=#FCCF67 gui=bold guifg=#171C21
hi TodoBgTEST guibg=#54CED6 gui=bold guifg=#171C21
hi TodoBgTODO guibg=#C397D8 gui=bold guifg=#171C21
hi TodoBgUPDATE guibg=#B77EE0 gui=bold guifg=#171C21
hi TodoBgWANTS guibg=#FFEDA6 gui=bold guifg=#171C21
hi TodoBgWARN guibg=#E17272 gui=bold guifg=#171C21
hi TodoFgBUG guifg=#F87070
hi TodoFgCHORE guifg=#70C0BA
hi TodoFgCLEAN guifg=#7AB0DF
hi TodoFgDEMO guifg=#5FB0FC
hi TodoFgFIX guifg=#FFE59E
hi TodoFgHACK guifg=#79DCAA
hi TodoFgIMPROVE guifg=#5FB0FC
hi TodoFgNOTE guifg=#36C692
hi TodoFgPERF guifg=#FCCF67
hi TodoFgTEST guifg=#54CED6
hi TodoFgTODO guifg=#C397D8
hi TodoFgUPDATE guifg=#B77EE0
hi TodoFgWANTS guifg=#FFEDA6
hi TodoFgWARN guifg=#E17272
hi Todo guifg=#FFE59E guibg=NONE
hi TodoSignBUG guibg=#101317 guifg=#F87070
hi TodoSignCHORE guibg=#101317 guifg=#70C0BA
hi TodoSignCLEAN guibg=#101317 guifg=#7AB0DF
hi TodoSignDEMO guibg=#101317 guifg=#5FB0FC
hi TodoSignFIX guibg=#101317 guifg=#FCCF67
hi TodoSignHACK guibg=#101317 guifg=#79DCAA
hi TodoSignIMPROVE guibg=#101317 guifg=#5FB0FC
hi TodoSignNOTE guibg=#101317 guifg=#36C692
hi TodoSignPERF guibg=#101317 guifg=#FCCF67
hi TodoSignTEST guibg=#101317 guifg=#54CED6
hi TodoSignTODO guibg=#101317 guifg=#C397D8
hi TodoSignUPDATE guibg=#101317 guifg=#B77EE0
hi TodoSignWANTS guibg=#101317 guifg=#FFEDA6
hi TodoSignWARN guibg=#101317 guifg=#E17272
hi TreesitterContext guibg=#171A20
hi TroubleNormal guibg=#0C0E11
hi Typedef guifg=#C397D8
hi Type guifg=#F87070
hi Underlined gui=underline
hi UndotreeBranch guifg=#FF6666
hi UndotreeCurrent guifg=#F87070
hi UndotreeFirstNode guifg=#BE8FD7
hi UndotreeHead guifg=#36C692
hi UndotreeHelp guifg=#515C68
hi UndotreeHelpKey gui=bold guifg=#F87070
hi UndotreeHelpTitle guifg=#F87070
hi UndotreeNext guifg=#7AB0DF
hi UndotreeNodeCurrent guifg=#E1C58D
hi UndotreeNode guifg=#79DCAA
hi UndotreeSavedBig guibg=#202530 gui=bold
hi UndotreeSavedSmall guifg=#FB7373
hi UndotreeSeq guifg=#515C68
hi UndotreeTimeStamp guifg=#70C0BA
hi VertSplit guifg=#171C21
hi VirtColumn guibg=#101317 guifg=#171A20
hi Visual guibg=#192023
hi WarningMsg guifg=#FB7373
hi WhichKeyBorder guibg=#0E1014
hi WhichKeyDesc guifg=#FFE59E
hi WhichKeyFloat guibg=#0E1014
hi WhichKeyGroup gui=bold guifg=#F87070
hi WhichKey guifg=#C397D8
hi WhichKeySeparator guifg=#7AB0DF
hi WhichKeyValue guifg=#929299
hi Whitespace guifg=#1E222A
hi WildMenu guibg=#7AB0DF guifg=#101317
hi WinBar gui=bold
hi WinBarNC gui=bold
hi WinSeparator guifg=#171C21

if has('nvim')
  hi @boolean gui=bold guifg=#F87070
  hi @character guifg=#E1C58D
  hi @comment guifg=#515C68
  hi @conditional guifg=#F87070
  hi @constant.builtin gui=bold guifg=#FFDF85
  hi @constant gui=bold guifg=#FF6666
  hi @constant.macro guifg=#E37070
  hi @constructor guifg=#5FB0FC
  hi @debug guifg=#7AAFC5
  hi @define guifg=#C397D8
  hi @exception guifg=#6AA6DF
  hi @field guifg=#36C692
  hi @float guifg=#F3A4F1
  hi @function.builtin gui=bold guifg=#36C692
  hi @function guifg=#BE8FD7
  hi @function.macro guifg=#FF7070
  hi @include gui=bold guifg=#6AA6DF
  hi @keyword.function guifg=#FB7373
  hi @keyword guifg=#66B3FF
  hi @keyword.operator guifg=#70C0BA
  hi @keyword.return guifg=#66B3FF
  hi @label guifg=#F87070
  hi @lua.constant.cmd gui=bold guifg=#60B0FC
  hi @lua.constant.vim gui=bold guifg=#FF6666
  hi @lua.function.pcall gui=bold guifg=#F98989
  hi @lua.parameter.self gui=bold guifg=#FFCE66
  hi @macro guifg=#F98989
  hi @method guifg=#B77EE0
  hi @namespace guifg=#60B0FC
  hi @number guifg=#54CED6
  hi @operator guifg=#70C0BA
  hi @parameter guifg=#FFE49D
  hi @preproc guifg=#F96262
  hi @property guifg=#54CED6
  hi @punctuation.bracket guifg=#FF7D7D
  hi @punctuation.delimiter guifg=#7AB0DF
  hi @punctuation guifg=#7AB0DF
  hi @repeat guifg=#B77EE0
  hi @storageclass guifg=#F75858
  hi @string.escape guifg=#E5E49D
  hi @string guifg=#79DCAA
  hi @string.regex guifg=#FFE390
  hi @string.special guifg=#FCCF67
  hi @structure guifg=#5FB0FC
  hi @tag guifg=#7AB0DF
  hi @text guifg=#D4D4D5
  hi @text.literal guifg=#79CFAA
  hi @text.reference guifg=#7AB0DF
  hi @text.title gui=bold guifg=#FA6969
  hi @text.todo guifg=#FFE59E
  hi @text.underline gui=underline
  hi @text.uri guifg=#70C0BA gui=underline
  hi @type.definition guifg=#C397D8
  hi @type guifg=#F87070
  hi @variable guifg=#D4D4D5

  hi link @lsp.type.boolean @boolean 
  hi link @lsp.type.builtinType @type.builtin 
  hi link @lsp.type.comment @comment 
  hi link @lsp.type.enum @type 
  hi link @lsp.type.enumMember @constant 
  hi link @lsp.type.escapeSequence @string.escape 
  hi link @lsp.type.formatSpecifier @punctuation.special 
  hi link @lsp.type.interface Structure
  hi link @lsp.type.keyword @keyword
  hi link @lsp.type.namespace @namespace
  hi link @lsp.type.number @number 
  hi link @lsp.type.operator @operator 
  hi link @lsp.type.parameter @parameter 
  hi link @lsp.type.property @property 
  hi link @lsp.type.selfKeyword @variable.builtin 
  hi link @lsp.type.typeAlias @type.definition 
  hi link @lsp.type.unresolvedReference @error 
  hi link @lsp.typemod.class.defaultLibrary @type.builtin 
  hi link @lsp.typemod.enum.defaultLibrary @type.builtin 
  hi link @lsp.typemod.enumMember.defaultLibrary @constant.builtin 
  hi link @lsp.typemod.function.defaultLibrary @function.builtin 
  hi link @lsp.typemod.keyword.async @keyword.coroutine 
  hi link @lsp.typemod.macro.defaultLibrary @function.builtin 
  hi link @lsp.typemod.method.defaultLibrary @function.builtin 
  hi link @lsp.typemod.operator.injected @operator 
  hi link @lsp.typemod.string.injected @string 
  hi link @lsp.typemod.type.defaultLibrary @type.builtin 
  hi link @lsp.typemod.variable.defaultLibrary @variable.builtin 
  hi link @lsp.typemod.variable.injected @variable 
endif
