local status, undotree = pcall(require, "undo-tree")
if (not status) then return end

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
undotree.setup {
}

