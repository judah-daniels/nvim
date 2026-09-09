-- eink: a monochrome colourscheme for the Kindle-over-SSH display.
--
-- Design constraints, in order:
--
-- 1. The panel is greyscale, so hue carries no information at all. Structure
--    comes from tone and weight instead: nine greys and bold/underline.
-- 2. That client advertises neither RGB nor 256 to tmux, so tmux quantises
--    truecolor down to the xterm-256 palette on the way out. Every colour
--    below is an exact member of that palette, and every group sets ctermfg
--    and ctermbg alongside fg/bg, so the scheme survives the trip losslessly
--    (and still works with termguicolors off).
-- 3. Large dark areas refresh slowly and ghost badly, so the darkest
--    background here is #bcbcbc and nothing is filled black. Reverse video is
--    reserved for the cursor and the current search match.
-- 4. Italic is not used: at this font size on a bitmap-font terminal it is
--    either unreadable or silently ignored, so tone does that work instead.

vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') == 1 then vim.cmd('syntax reset') end
vim.o.background = 'light'
vim.g.colors_name = 'eink'

-- gui hex and the cterm index it is an exact match for
local pal = {
  white = { '#ffffff', 231 },
  paper = { '#eeeeee', 255 },
  pale  = { '#e4e4e4', 254 },
  light = { '#d0d0d0', 252 },
  mid   = { '#bcbcbc', 250 },
  grey  = { '#8a8a8a', 245 },
  dim   = { '#585858', 240 },
  dark  = { '#262626', 235 },
  black = { '#000000',  16 },
}

local function hl(group, spec)
  local out = {}
  for k, v in pairs(spec) do
    if k == 'fg' then
      out.fg, out.ctermfg = pal[v][1], pal[v][2]
    elseif k == 'bg' then
      out.bg, out.ctermbg = pal[v][1], pal[v][2]
    elseif k == 'sp' then
      out.sp = pal[v][1]
    else
      out[k] = v
    end
  end
  vim.api.nvim_set_hl(0, group, out)
end

local function link(from, to)
  vim.api.nvim_set_hl(0, from, { link = to })
end

-- Editor -------------------------------------------------------------------
hl('Normal',       { fg = 'black', bg = 'white' })
hl('NormalNC',     { fg = 'black', bg = 'white' })
hl('NormalFloat',  { fg = 'black', bg = 'pale' })   -- floats read as a lighter panel
hl('FloatBorder',  { fg = 'dim',   bg = 'pale' })
hl('FloatTitle',   { fg = 'black', bg = 'pale', bold = true })
hl('Cursor',       { reverse = true })
hl('lCursor',      { reverse = true })
hl('TermCursor',   { reverse = true })
hl('CursorLine',   { bg = 'paper' })
hl('CursorColumn', { bg = 'paper' })
hl('ColorColumn',  { bg = 'pale' })
hl('Visual',       { bg = 'mid' })
hl('VisualNOS',    { bg = 'light' })
hl('LineNr',       { fg = 'grey' })
hl('LineNrAbove',  { fg = 'grey' })
hl('LineNrBelow',  { fg = 'grey' })
hl('CursorLineNr', { fg = 'black', bold = true })
hl('SignColumn',   { fg = 'black', bg = 'white' })
hl('StatusLine',   { fg = 'black', bg = 'light' })
hl('StatusLineNC', { fg = 'dim',   bg = 'pale' })
hl('TabLine',      { fg = 'dim',   bg = 'pale' })
hl('TabLineSel',   { fg = 'black', bg = 'white', bold = true })
hl('TabLineFill',  { bg = 'pale' })
hl('WinSeparator', { fg = 'mid' })
hl('Folded',       { fg = 'dim',   bg = 'pale' })
hl('FoldColumn',   { fg = 'grey' })
hl('NonText',      { fg = 'mid' })
hl('SpecialKey',   { fg = 'mid' })
hl('Whitespace',   { fg = 'mid' })
hl('EndOfBuffer',  { fg = 'mid' })
hl('Conceal',      { fg = 'dim' })
hl('Directory',    { fg = 'black', bold = true })
hl('Title',        { fg = 'black', bold = true })
hl('MatchParen',   { bg = 'light', bold = true })
hl('QuickFixLine', { bg = 'mid' })
hl('Search',       { fg = 'black', bg = 'mid' })
hl('CurSearch',    { reverse = true })
hl('IncSearch',    { reverse = true })
hl('Substitute',   { fg = 'black', bg = 'mid', bold = true })
hl('WildMenu',     { fg = 'black', bg = 'mid', bold = true })
hl('Pmenu',        { fg = 'black', bg = 'pale' })
hl('PmenuSel',     { fg = 'black', bg = 'mid', bold = true })
hl('PmenuSbar',    { bg = 'light' })
hl('PmenuThumb',   { bg = 'dim' })
hl('ModeMsg',      { fg = 'black', bold = true })
hl('MoreMsg',      { fg = 'black', bold = true })
hl('Question',     { fg = 'black', bold = true })
hl('ErrorMsg',     { fg = 'black', bold = true, underline = true })
hl('WarningMsg',   { fg = 'black', bold = true })
hl('MsgArea',      { fg = 'black' })
hl('MsgSeparator', { fg = 'dim',   bg = 'pale' })

-- Syntax: bold marks the words that structure the code, tone recedes the
-- text that is only there to be read (comments, strings, punctuation).
hl('Comment',      { fg = 'dim' })
hl('String',       { fg = 'dark' })
hl('Character',    { fg = 'dark' })
hl('Constant',     { fg = 'black' })
hl('Number',       { fg = 'black' })
hl('Float',        { fg = 'black' })
hl('Boolean',      { fg = 'black' })
hl('Identifier',   { fg = 'black' })
hl('Function',     { fg = 'black' })
hl('Statement',    { fg = 'black', bold = true })
hl('Conditional',  { fg = 'black', bold = true })
hl('Repeat',       { fg = 'black', bold = true })
hl('Label',        { fg = 'black', bold = true })
hl('Operator',     { fg = 'black' })
hl('Keyword',      { fg = 'black', bold = true })
hl('Exception',    { fg = 'black', bold = true })
hl('PreProc',      { fg = 'black', bold = true })
hl('Include',      { fg = 'black', bold = true })
hl('Define',       { fg = 'black', bold = true })
hl('Macro',        { fg = 'black', bold = true })
hl('PreCondit',    { fg = 'black', bold = true })
hl('Type',         { fg = 'black', bold = true })
hl('StorageClass', { fg = 'black', bold = true })
hl('Structure',    { fg = 'black', bold = true })
hl('Typedef',      { fg = 'black', bold = true })
hl('Special',      { fg = 'dim' })
hl('SpecialChar',  { fg = 'dim' })
hl('Delimiter',    { fg = 'dim' })
hl('Tag',          { fg = 'black', underline = true })
hl('Debug',        { fg = 'black', bold = true })
hl('Underlined',   { underline = true })
hl('Ignore',       { fg = 'mid' })
hl('Error',        { fg = 'black', bold = true, underline = true })
hl('Todo',         { fg = 'black', bg = 'mid', bold = true })

-- Diagnostics: severity by weight, since colour cannot carry it. Signs stay
-- black so they are legible in the one-column statuscolumn from base.lua.
hl('DiagnosticError', { fg = 'black', bold = true })
hl('DiagnosticWarn',  { fg = 'black' })
hl('DiagnosticInfo',  { fg = 'dim' })
hl('DiagnosticHint',  { fg = 'dim' })
hl('DiagnosticOk',    { fg = 'dim' })
hl('DiagnosticUnderlineError', { underline = true })
hl('DiagnosticUnderlineWarn',  { underline = true })
hl('DiagnosticUnderlineInfo',  {})
hl('DiagnosticUnderlineHint',  {})
hl('DiagnosticSignError', { fg = 'black', bold = true })
hl('DiagnosticSignWarn',  { fg = 'black' })
hl('DiagnosticSignInfo',  { fg = 'dim' })
hl('DiagnosticSignHint',  { fg = 'dim' })
hl('DiagnosticVirtualTextError', { fg = 'dim' })
hl('DiagnosticVirtualTextWarn',  { fg = 'dim' })
hl('DiagnosticVirtualTextInfo',  { fg = 'grey' })
hl('DiagnosticVirtualTextHint',  { fg = 'grey' })
hl('LspReferenceText',  { bg = 'pale' })
hl('LspReferenceRead',  { bg = 'pale' })
hl('LspReferenceWrite', { bg = 'pale', bold = true })
hl('LspInlayHint',      { fg = 'grey', bg = 'paper' })
hl('LspSignatureActiveParameter', { bold = true, underline = true })

-- Diffs and git ------------------------------------------------------------
hl('DiffAdd',    { bg = 'pale' })
hl('DiffChange', { bg = 'paper' })
hl('DiffText',   { bg = 'mid', bold = true })
hl('DiffDelete', { fg = 'mid' })
hl('diffAdded',   { fg = 'black', bold = true })
hl('diffRemoved', { fg = 'dim' })
hl('diffChanged', { fg = 'black' })
hl('diffFile',    { fg = 'black', bold = true })
hl('diffLine',    { fg = 'dim' })
hl('diffIndexLine', { fg = 'grey' })
hl('GitSignsAdd',    { fg = 'black' })
hl('GitSignsChange', { fg = 'black' })
hl('GitSignsDelete', { fg = 'black', bold = true })
hl('GitSignsAddLn',    { bg = 'pale' })
hl('GitSignsChangeLn', { bg = 'paper' })

-- Treesitter: most captures fall back to the groups above; these are the ones
-- with defaults of their own, plus the markup groups the vault leans on.
link('@comment', 'Comment')
link('@string', 'String')
link('@keyword', 'Keyword')
link('@function', 'Function')
link('@function.builtin', 'Function')
link('@type', 'Type')
link('@punctuation', 'Delimiter')
link('@punctuation.bracket', 'Delimiter')
link('@punctuation.delimiter', 'Delimiter')
link('@variable', 'Normal')
link('@variable.builtin', 'Identifier')
link('@property', 'Normal')
link('@field', 'Normal')
link('@constructor', 'Normal')
link('@tag', 'Tag')
link('@diff.plus', 'diffAdded')
link('@diff.minus', 'diffRemoved')
hl('@markup.strong',   { bold = true })
hl('@markup.italic',   { underline = true })   -- underline stands in for italic
hl('@markup.underline',{ underline = true })
hl('@markup.strike',   { fg = 'grey' })
hl('@markup.heading',  { fg = 'black', bold = true })
hl('@markup.quote',    { fg = 'dim' })
hl('@markup.raw',      { fg = 'dark', bg = 'paper' })
hl('@markup.link',     { fg = 'black', underline = true })
hl('@markup.link.url', { fg = 'dim',   underline = true })
hl('@markup.link.label', { fg = 'black', underline = true })
hl('@markup.list',     { fg = 'black', bold = true })
hl('@markup.list.checked',   { fg = 'dim' })
hl('@markup.list.unchecked', { fg = 'black', bold = true })

-- Markdown, as rendered by render-markdown.nvim ----------------------------
hl('RenderMarkdownH1',   { fg = 'black', bold = true })
hl('RenderMarkdownH2',   { fg = 'black', bold = true })
hl('RenderMarkdownH3',   { fg = 'black', bold = true })
hl('RenderMarkdownH4',   { fg = 'black', bold = true })
hl('RenderMarkdownH5',   { fg = 'dim',   bold = true })
hl('RenderMarkdownH6',   { fg = 'dim',   bold = true })
hl('RenderMarkdownH1Bg', { bg = 'pale' })
hl('RenderMarkdownH2Bg', { bg = 'paper' })
hl('RenderMarkdownH3Bg', { bg = 'white' })
hl('RenderMarkdownH4Bg', { bg = 'white' })
hl('RenderMarkdownH5Bg', { bg = 'white' })
hl('RenderMarkdownH6Bg', { bg = 'white' })
hl('RenderMarkdownCode',       { bg = 'paper' })
hl('RenderMarkdownCodeInline', { fg = 'dark', bg = 'paper' })
hl('RenderMarkdownBullet',     { fg = 'black', bold = true })
hl('RenderMarkdownDash',       { fg = 'mid' })
hl('RenderMarkdownQuote',      { fg = 'dim' })
hl('RenderMarkdownUnchecked',  { fg = 'black', bold = true })
hl('RenderMarkdownChecked',    { fg = 'dim' })
hl('RenderMarkdownTableHead',  { fg = 'black', bold = true })
hl('RenderMarkdownTableRow',   { fg = 'black' })
hl('RenderMarkdownLink',       { fg = 'black', underline = true })
hl('RenderMarkdownWikiLink',   { fg = 'black', underline = true })
link('markdownH1', 'Title')
link('markdownH2', 'Title')
link('markdownCode', '@markup.raw')
link('markdownUrl', '@markup.link.url')

-- Plugins ------------------------------------------------------------------
hl('TelescopeNormal',       { fg = 'black', bg = 'pale' })
hl('TelescopeBorder',       { fg = 'dim',   bg = 'pale' })
hl('TelescopeTitle',        { fg = 'black', bg = 'mid', bold = true })
hl('TelescopeSelection',    { fg = 'black', bg = 'mid', bold = true })
hl('TelescopeSelectionCaret', { fg = 'black', bg = 'mid', bold = true })
hl('TelescopeMatching',     { fg = 'black', bold = true, underline = true })
hl('TelescopePromptNormal', { fg = 'black', bg = 'light' })
hl('TelescopePromptBorder', { fg = 'dim',   bg = 'light' })
hl('TelescopePromptPrefix', { fg = 'black', bold = true })
hl('TelescopePromptCounter',{ fg = 'dim' })
hl('WhichKey',          { fg = 'black', bold = true })
hl('WhichKeyGroup',     { fg = 'black' })
hl('WhichKeyDesc',      { fg = 'black' })
hl('WhichKeySeparator', { fg = 'mid' })
hl('WhichKeyNormal',    { fg = 'black', bg = 'pale' })
hl('WhichKeyBorder',    { fg = 'dim',   bg = 'pale' })
hl('CmpItemAbbr',           { fg = 'black' })
hl('CmpItemAbbrMatch',      { fg = 'black', bold = true })
hl('CmpItemAbbrMatchFuzzy', { fg = 'black', bold = true })
hl('CmpItemAbbrDeprecated', { fg = 'grey' })
hl('CmpItemKind',           { fg = 'dim' })
hl('CmpItemMenu',           { fg = 'dim' })
hl('TodoFgTODO',  { fg = 'black', bold = true })
hl('TodoFgFIX',   { fg = 'black', bold = true })
hl('TodoFgHACK',  { fg = 'black', bold = true })
hl('TodoFgWARN',  { fg = 'black', bold = true })
hl('TodoFgNOTE',  { fg = 'dim',   bold = true })
hl('TodoFgPERF',  { fg = 'dim',   bold = true })
hl('TodoBgTODO',  { fg = 'black', bg = 'mid', bold = true })
hl('TodoBgFIX',   { fg = 'black', bg = 'mid', bold = true })
hl('TodoBgHACK',  { fg = 'black', bg = 'mid', bold = true })
hl('TodoBgWARN',  { fg = 'black', bg = 'mid', bold = true })
hl('TodoBgNOTE',  { fg = 'black', bg = 'pale', bold = true })
hl('TodoBgPERF',  { fg = 'black', bg = 'pale', bold = true })
link('TodoSignTODO', 'TodoFgTODO')
link('TodoSignFIX',  'TodoFgFIX')
link('TodoSignHACK', 'TodoFgHACK')
link('TodoSignWARN', 'TodoFgWARN')
link('TodoSignNOTE', 'TodoFgNOTE')
link('TodoSignPERF', 'TodoFgPERF')
hl('NotifyBackground',  { fg = 'black', bg = 'pale' })
hl('NotifyERRORTitle',  { fg = 'black', bold = true })
hl('NotifyWARNTitle',   { fg = 'black', bold = true })
hl('NotifyINFOTitle',   { fg = 'dim',   bold = true })
hl('NotifyDEBUGTitle',  { fg = 'dim' })
hl('NotifyTRACETitle',  { fg = 'dim' })
hl('StartupHeading',    { fg = 'black', bold = true })
