vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

function SetupColor(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "jukit_cellmarker_colors", { bg = "#1d213a" })
end

local iterm_profile = os.getenv("ITERM_PROFILE")

if iterm_profile == "light" then
  SetupColor("rose-pine-dawn")
else
  SetupColor("rose-pine")
end
