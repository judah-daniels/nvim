-- vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true -- Show Gutter numbers
vim.opt.mouse = "a"  -- enable mouse

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10
vim.opt.shell = 'bash'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true            -- Auto indent
vim.opt.si = true            -- Smart indent
vim.opt.wrap = true          -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.relativenumber = true

-- Minimal left gutter (small e-ink screen). Instead of a fold column + a 2-wide
-- sign column + a 4-wide number column, everything shares one column: the
-- relative number (absolute on the cursor line), replaced by the gitsigns /
-- diagnostic sign on lines that have one. Width is digits + 1 separator space.
local function minimal_statuscolumn()
  if not (vim.wo.number or vim.wo.relativenumber) then return '' end
  local lnum = vim.v.lnum
  local best, best_prio
  local marks = vim.api.nvim_buf_get_extmarks(0, -1, { lnum - 1, 0 }, { lnum - 1, -1 },
    { type = 'sign', details = true })
  for _, m in ipairs(marks) do
    local d = m[4]
    if d.sign_text and (not best_prio or (d.priority or 0) >= best_prio) then
      best, best_prio = d, d.priority or 0
    end
  end
  if best then
    return '%=%#' .. (best.sign_hl_group or 'SignColumn') .. '#' .. vim.trim(best.sign_text) .. '%* '
  end
  return '%=' .. (vim.v.relnum == 0 and vim.v.lnum or vim.v.relnum) .. ' '
end
_G.MinimalStatusColumn = minimal_statuscolumn

vim.opt.numberwidth = 1
vim.opt.signcolumn = 'no'
vim.opt.foldcolumn = '0'
vim.opt.statuscolumn = '%!v:lua.MinimalStatusColumn()'
vim.g.shell = "zsh";

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.g.ormolu_command = "fourmolu"
vim.g.ormolu_options = { "--stdin-input-file `git rev-parse --show-toplevel`" }
-- vim.g.ormolu_options={"--no-cabal"}
vim.g.ormolu_suppress_stderr = 1
--
vim.opt.foldenable = false

vim.g.clipboard = 'osc52'

if vim.env.TMUX ~= nil then
  local copy = {'tmux', 'load-buffer', '-w', '-'}
  local paste = {'bash', '-c', 'tmux refresh-client -l && sleep 0.05 && tmux save-buffer -'}
  vim.g.clipboard = {
    name = 'tmux',
    copy = {
      ['+'] = copy,
      ['*'] = copy,
    },
    paste = {
      ['+'] = paste,
      ['*'] = paste,
    },
    cache_enabled = 0,
  }
end

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})


-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Add asterisks in block comments
-- t_out_hist
--   vim.opt.formatoptions:append { 'r' }
-- o

-- vim.cmd('colorscheme rose-pine')
