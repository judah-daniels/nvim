local status, vimormolu = pcall(require, "vim-ormolu")
if (not status) then return end

vimormolu.setup{ }


