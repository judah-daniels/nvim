local status, ufo = pcall(require, "ufo")
if (not status) then return end

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)

-- Neovim >= 0.11 advertises textDocument/foldingRange to every LSP server by
-- default, so no extra capabilities setup is needed for the LSP provider.
ufo.setup()
