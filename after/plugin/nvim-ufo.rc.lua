local status, ufo = pcall(require, "ufo")
if (not status) then return end

vim.o.foldcolumn = '0' -- no fold gutter: keep the left margin minimal on the e-ink screen
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)

-- Neovim >= 0.11 advertises textDocument/foldingRange to every LSP server by
-- default, so no extra capabilities setup is needed for the LSP provider.
ufo.setup({
  -- Close folds of these LSP kinds when a buffer is first shown. obsidian-ls
  -- reports a note's YAML frontmatter as an "imports" fold, so Obsidian notes
  -- open with the frontmatter collapsed (see after/ftplugin/markdown.lua).
  close_fold_kinds_for_ft = {
    markdown = { 'imports' },
  },
})
