local status, undotree = pcall(require, "undo-tree")
if (not status) then return end

undotree.setup {
}

