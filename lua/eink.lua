-- E-ink tuning for the Kindle-over-SSH display.
--
-- On a normal screen a redraw is free, so nvim's defaults happily repaint a
-- line (or the whole window) on every keystroke. On e-ink each changed cell
-- costs a panel refresh and leaves grey ghosting behind, so everything here
-- trades update frequency for fewer, larger, less frequent redraws.
--
-- Comment out `require('eink')` in init.lua to get normal-display behaviour
-- back; after/plugin/zz-eink.rc.lua keys off vim.g.eink and drops out too.
vim.g.eink = true

-- SCROLLING -----------------------------------------------------------------
-- base.lua's scrolloff=10 means every j/k within 10 lines of an edge scrolls
-- the window by one line -- a whole-screen repaint per keystroke, which is the
-- worst case for this panel. With scrolloff=0 the view only moves when the
-- cursor actually leaves it, and scrolljump then moves it half a window at a
-- time: one refresh per half page instead of one per line, cursor landing
-- mid-screen.
vim.opt.scrolloff = 0
vim.opt.scrolljump = -50             -- negative = percent of window height
vim.opt.smoothscroll = false         -- would scroll per screen line, not per text line
vim.opt.mousescroll = 'ver:10,hor:6' -- fewer, bigger wheel/touch steps

-- REDRAWS THAT FOLLOW THE CURSOR --------------------------------------------
-- relativenumber rewrites the entire number column on every cursor move. Plain
-- numbers leave the gutter static (base.lua's statuscolumn handles either).
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.cursorline = false      -- a grey band dragged down the screen, 2 rows per move
vim.g.loaded_matchparen = 1     -- paren highlight repaints on every move
vim.opt.showcmd = false         -- pending keys repaint the cmdline per keypress
vim.opt.showmode = false        -- lualine already shows the mode
vim.opt.ruler = false
vim.opt.shortmess:append('sc')  -- fewer transient cmdline messages

-- No cursor shape sequences. The Kindle terminal reports TERM=xterm-256color
-- but does not implement DECSCUSR, so it prints nvim's cursor-shape bytes as
-- literal text on the cursor line ("^[[2 q"). Asking for a steady block was
-- pointless anyway: nothing nvim sends can stop that terminal blinking, and
-- ~/.tmux.conf now strips the sequences before they ever reach it.
vim.opt.guicursor = ''

-- TYPING AND SEARCHING ------------------------------------------------------
vim.opt.incsearch = false  -- no jump-and-repaint per typed character
vim.opt.inccommand = ''    -- base.lua's 'split' live-previews :s in a split
vim.opt.hlsearch = true    -- static once drawn, so this one is fine
vim.opt.pumheight = 8      -- cap the screen area a completion popup dirties
vim.opt.lazyredraw = true  -- skip intermediate frames inside macros and mappings

-- Diagnostics: nvim already keeps virtual text off and doesn't update in insert
-- mode. The underline is the remaining churn, and the sign in the statuscolumn
-- carries the same information without touching the text.
vim.diagnostic.config({ underline = false, signs = true })

-- GHOSTING ------------------------------------------------------------------
-- Kindle terminals only do a full panel refresh when enough of the screen
-- changes, so accumulated ghosting can sit there through a plain <C-l>.
-- Inverting every cell for a moment forces that full refresh and wipes it.
vim.api.nvim_create_user_command('EinkFlash', function()
  local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
  vim.api.nvim_set_hl(0, 'Normal', { fg = normal.bg, bg = normal.fg })
  vim.cmd('mode | redraw')
  vim.defer_fn(function()
    vim.api.nvim_set_hl(0, 'Normal', normal)
    vim.cmd('mode | redraw')
  end, 200)
end, { desc = 'Invert the screen briefly to clear e-ink ghosting' })

vim.keymap.set('n', '<leader>rr', '<cmd>EinkFlash<cr>', { desc = 'Clear e-ink ghosting' })
