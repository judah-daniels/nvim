local status, vimtex = pcall(require, "vimtex")
if (not status) then return end

vimtex.setup({
  keymaps = {
  }


})

vim.opt.vimtex_view_method = 'zathura'
