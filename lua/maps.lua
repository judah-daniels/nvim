local keymap = vim.keymap

vim.g.mapleader = ","

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement using +/-
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Snippets
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'

-- Format File
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Git
keymap.set("n", "<leader>g", vim.cmd.Git)

-- Undo Tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- debug
keymap.set("n", "<leader>dt", ':lua require("dapui").toggle()<CR>')
keymap.set("n", "<leader>de", ':lua require("dapui").eval()<CR>')
keymap.set("n", "<leader>ds", ':DapStepInto<CR>')
keymap.set("n", "<leader>dn", ':DapStepOver<CR>')
keymap.set("n", "<leader>do", ':DapStepOut<CR>')
keymap.set("n", "<leader>db", ':DapToggleBreakpoint<CR>')
keymap.set("n", "<leader>dc", ':DapContinue<CR>')

keymap.set("n", "<leader><Space>", ':OverseerRun<CR>')
keymap.set("n", "<leader>ot", ':OverseerToggle<CR>')
