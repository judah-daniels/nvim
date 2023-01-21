local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"
local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)
-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.api.nvim_command(install_cmd)
end

local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer is not installed")
  return
end

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'gbprod/substitute.nvim'
  use 'mbbill/undotree'

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- LSP Zero Language Server Configuration
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }


  use 'sdiehl/vim-ormolu'

  -- Latex Support
  use 'lervag/vimtex'
  use 'KeitaNakamura/tex-conceal.vim'
  use 'sirver/ultisnips'

  use 'gbrlsnchs/telescope-lsp-handlers.nvim'
  -- Markdown Support
  use({ "plasticboy/vim-markdown", ft = { "markdown" } })
  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, }

  -- Haskell Support
  use 'neovimhaskell/haskell-vim'

  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  -- use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  -- use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  -- use 'sbdchd/neoformat'

  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'

  use 'akinsho/nvim-bufferline.lua'

  -- Surround - remove brackets etc
  use 'kylechui/nvim-surround'

  -- Git Support
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  -- use 'dinhhuy258/git.nvim' -- For git blame & browse

  use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })

  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  use { 'godlygeek/tabular', cmd = { "Tabularize" } }

  -- use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }}

  use 'numToStr/Comment.nvim'

  use 'LnL7/vim-nix'
  use 'ThePrimeagen/vim-be-good'

  use 'folke/which-key.nvim'

  -- Color Schemes
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use 'rose-pine/neovim'

  use 'nyoom-engineering/nyoom.nvim'
end)
