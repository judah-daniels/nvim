-- Frontmatter folding for Obsidian notes.
--
-- obsidian.nvim runs an in-process language server (obsidian-ls) whose
-- textDocument/foldingRange reports the YAML frontmatter as a fold of kind
-- "imports" plus one "region" fold per heading section. nvim-ufo already
-- provides folds from LSP, and its close_fold_kinds_for_ft option (set in
-- after/plugin/nvim-ufo.rc.lua) closes the "imports" fold when the buffer is
-- first shown, so notes open with the frontmatter collapsed. zo / zc / za on
-- line 1 show and hide it; zR (ufo.openAllFolds) opens it too.
--
-- The folding source must be ufo alone: vim-markdown's own heading folding is
-- switched off in lua/plugins.lua (g:vim_markdown_folding_disabled) because
-- it re-asserted foldmethod=expr on every BufWinEnter and undid ufo's folds.
--
-- Note: obsidian's smart_action (<CR>) only cycles folds when foldmethod is
-- "expr", and ufo sets it to "manual", so <CR> inside the frontmatter does
-- nothing special here; use za.

-- <leader>oa: align the pipe table under the cursor. :TableFormat is
-- vim-markdown's buffer-local command (tabular underneath); the table needs
-- a separator row (|--|--|) as its second line, like Obsidian's own editor.
vim.keymap.set("n", "<leader>oa", function()
  local view = vim.fn.winsaveview()
  vim.cmd "TableFormat"
  -- Tabularize pads every column, including the empty one before the first
  -- pipe, so each row comes back with a leading space. Strip it from the
  -- paragraph (the table) under the cursor.
  vim.cmd [[silent! '{,'}s/^ |/|/e]]
  vim.fn.winrestview(view)
end, { buffer = true, desc = "Align table" })

local ok, ufo = pcall(require, "ufo")
if not ok then
  return
end

-- Fold text. The default shows the folded line itself, which for frontmatter
-- is just "---", followed by a "⋯" glyph. Show "Properties" (what the Obsidian
-- app calls it) and a line count instead, in plain ASCII for the e-ink
-- terminal font.
ufo.setFoldVirtTextHandler(0, function(virtText, lnum, endLnum, width, truncate)
  local count = endLnum - lnum
  local suffix = (" ... %d lines"):format(count)

  if lnum == 1 and vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] == "---" then
    return { { "--- Properties" .. suffix, "Folded" } }
  end

  local newVirtText = {}
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      table.insert(newVirtText, { chunkText, chunk[2] })
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "UfoFoldedEllipsis" })
  return newVirtText
end)
