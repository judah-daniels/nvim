local keymap = vim.keymap

vim.g.mapleader = ","

-- OSC osc52 mappings
-- keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
-- keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
-- keymap.set('v', '<leader>c', require('osc52').copy_visual)

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
keymap.set("n", "<leader>oa", ':OverseerQuickAction<CR>')
keymap.set("n", "<leader>of", ':OverseerQuickAction open float<CR>')

local VAULT = vim.fn.expand("~/obsidian_vault")

-- Layout that adapts to the terminal it's running in.
local function picker_opts(title, extra)
  local small = vim.o.lines < 40 or vim.o.columns < 100

  local opts = {
    prompt_title = title,
    cwd = VAULT,
    sorting_strategy = "ascending",
    layout_strategy = small and "vertical" or "horizontal",
    layout_config = small and {
      width = 0.98,
      height = 0.98,
      preview_height = 0.6,
      preview_cutoff = 0,
      prompt_position = "bottom",
    } or {
      width = 0.9,
      height = 0.9,
      preview_width = 0.55,
    },
  }

  if small then
    opts.borderchars = { " ", " ", " ", " ", " ", " ", " ", " " }
    opts.results_title = false
  end

  return vim.tbl_extend("force", opts, extra or {})
end

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ot", function()
  builtin.grep_string(picker_opts("Open tasks", { search = "- [ ] #todo" }))
end, { desc = "Open tasks" })

map("n", "<leader>ow", function()
  builtin.grep_string(picker_opts("#todo", { search = "- [ ] #wishlist" }))
end, { desc = "Tagged wishlist" })

map("n", "<leader>og", function()
  builtin.live_grep(picker_opts("Search vault"))
end, { desc = "Grep vault" })

map("n", "<leader>of", function()
  builtin.find_files(picker_opts("Notes", { hidden = false }))
end, { desc = "Find notes" })

