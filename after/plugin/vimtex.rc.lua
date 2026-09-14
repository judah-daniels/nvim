-- vimtex is a Vimscript plugin: configure it through g: variables.
vim.g.vimtex_fold_enable = 0

-- Use zathura as the PDF viewer when it is available; otherwise vimtex falls
-- back to its 'general' viewer (xdg-open / open).
if vim.fn.executable('zathura') == 1 then
  vim.g.vimtex_view_method = 'zathura'
end
