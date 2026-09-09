
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
--
-- return require('packer').startup(function(use)
--   use 'wbthomason/packer.nvim'
--   -- My plugins here
--   -- use 'foo1/bar1.nvim'
--   -- use 'foo2/bar2.nvim'
--
--   -- Automatically set up your configuration after cloning packer.nvim
--   -- Put this at the end after all plugins
--   if packer_bootstrap then
--     require('packer').sync()
--   end
-- end)

require('base')
require('highlights')
require('maps')
require('eink')   -- e-ink overrides; must follow base/highlights (options) and maps (mapleader)
require('plugins')
-- require('ltex')
-- LSP lives in plugin/lspconfig.lua, which nvim sources automatically -- no require here.
--
-- local has = function(x)
--   return vim.fn.has(x) == 1
-- end
-- local is_mac = has "macunix"
-- local is_win = has "win32"
--
-- if is_mac then
--   require('macos')
-- end
-- if is_win then
--   require('windows')
-- end
