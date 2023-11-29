local fn = vim.fn

-- Auto-install packer in case it hasn't been installed.
vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"
local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

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
  -- Packer Plugin Manager
  use 'wbthomason/packer.nvim'

  -- Provides language parsers
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


  -- LSP ZERO - Language Server Protocol with nice keybindings
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' }
    }
  }


  -- APPEARANCE AND NAVIGATION
  -- Substitute: sxw sxw to swap words etc
  use 'gbprod/substitute.nvim'

  -- Undo Tree - see undo history. ,u
  use 'mbbill/undotree'

  -- Nvim telescope, view all git files, file browser etc
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'kyazdani42/nvim-web-devicons' -- File icons

  -- Integrates LSP with Telescope
  use 'gbrlsnchs/telescope-lsp-handlers.nvim'


  use 'nvim-lualine/lualine.nvim'   -- Statusline
  use 'nvim-lua/plenary.nvim'       -- Common utilities
  use 'onsails/lspkind-nvim'        -- vscode-like pictograms

  use 'windwp/nvim-autopairs'       -- Auto close parentheses etc
  use 'windwp/nvim-ts-autotag'      -- Auto rename and close html tags
  use 'norcalli/nvim-colorizer.lua' -- Show HEX colours in the editor. #8080ff
  use 'folke/zen-mode.nvim'         -- Zen Mode, :ZenMode to remove distractions

  -- TMUX integration - clipboard etc.
  use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })

  -- Surround - remove brackets etc, very nifty
  use 'kylechui/nvim-surround'

  -- Git Support
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Comment Plugin - gcc to comment/uncomment a line
  use 'numToStr/Comment.nvim'

  -- WHICH KEY: show key bindings
  use 'folke/which-key.nvim'

  -- Color Schemes
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use 'rose-pine/neovim' -- my favourite

  use 'f-person/auto-dark-mode.nvim'

  -- ASCIIDOC PLUGINS
  use 'habamax/vim-asciidoctor'

  use { 'shuntaka9576/preview-asciidoc.vim',
    requires = { { "vim-denops/denops.vim" } }
  }

  -- DAFNY
  use { 'mlr-msft/vim-loves-dafny' }
  use { 'benknoble/vim-dafny' }

  -- HASKELL
  use 'neovimhaskell/haskell-vim'
  use 'sdiehl/vim-ormolu'

  -- VIM NIX integration
  use 'LnL7/vim-nix'

  -- CSV Suuport
  use 'cameron-wags/rainbow_csv.nvim'

  -- Latex Support
  use 'lervag/vimtex'
  use 'KeitaNakamura/tex-conceal.vim'
  use 'sirver/ultisnips'

  -- Markdown Support
  use({ "plasticboy/vim-markdown", ft = { "markdown" } })
  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, }
  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  use { 'godlygeek/tabular', cmd = { "Tabularize" } }

  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
end)
