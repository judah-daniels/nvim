local status, haskellvim = pcall(require, "haskell-vim")
if (not status) then return end

haskellvim.setup {
}

vim.g.haskell_enable_quantification = 1 
vim.g.haskell_enable_recursivedo = 1    
vim.g.haskell_enable_arrowsyntax = 1     
vim.g.haskell_enable_pattern_synonyms = 1
vim.g.haskell_enable_typeroles = 1      
vim.g.haskell_enable_static_pointers = 1 
vim.g.haskell_backpack = 1                

