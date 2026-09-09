vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 0 -- solid popup menus; blending cuts contrast on e-ink
-- E-ink screen over SSH: the display is a light ground, so nvim must pick dark
-- foregrounds. Set before the colorscheme -- dayfox reasserts 'light' itself,
-- but a scheme that honours this option needs it correct up front.
vim.opt.background = 'light'

-- Pin the colorscheme. Without one, nvim's built-in default collapses
-- Statement/String/Number to the same near-white, which made the startup.nvim
-- dashboard (it colours its three sections with exactly those groups)
-- unreadable.
--
-- 'eink' (colors/eink.lua) replaces dayfox: nine greys from the xterm-256
-- palette, structure carried by tone and boldness rather than hue. dayfox is a
-- truecolor pastel scheme, and the Kindle client advertises no RGB to tmux, so
-- its hues were being quantised into near-identical mid-greys -- exactly the
-- tones that ghost worst. Swap back any time with :colorscheme dayfox.
vim.cmd.colorscheme('eink')

-- function SetupColor(color)
--   color = color or "gruvbox"
--   vim.cmd.colorscheme(color)
--
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   vim.api.nvim_set_hl(0, "jukit_cellmarker_colors", { bg = "#1d213a" })
-- end
--
-- SetupColor("gruvbox");
