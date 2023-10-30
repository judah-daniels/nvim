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

  use {
      'cameron-wags/rainbow_csv.nvim',
      config = function()
          require 'rainbow_csv'.setup()
      end,
      -- optional lazy-loading below
      module = {
          'rainbow_csv',
          'rainbow_csv.fns'
      },
      ft = {
          'csv',
          'tsv',
          'csv_semicolon',
          'csv_whitespace',
          'csv_pipe',
          'rfc_csv',
          'rfc_semicolon'
      }
  }



  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' }

    }

  }

  use 'gbrlsnchs/telescope-lsp-handlers.nvim'

  -- APPEARANCE AND NAVIGATION
  -- Substitute: sxw sxw to swap words etc
  use 'gbprod/substitute.nvim'
  use 'mbbill/undotree'

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })

  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

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


  -- PROGRAMMING LANGUAGE PLUGINS
  --
  -- C++
  -- NVIM DAP - debugging protocol
  use 'mfussenegger/nvim-dap'
  use 'jay-babu/mason-nvim-dap.nvim'

  use "rcarriga/nvim-dap-ui"


  -- DAFNY
  use { 'mlr-msft/vim-loves-dafny' }
  use { 'benknoble/vim-dafny' }

  -- HASKELL
  use 'neovimhaskell/haskell-vim'
  use 'sdiehl/vim-ormolu'

  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }}

  -- Comment Plugin gcc to comment a line
  use 'numToStr/Comment.nvim'

  -- VIM NIX integration
  use 'LnL7/vim-nix'

  -- WHICH KEY: show key bindings
  use 'folke/which-key.nvim'

  -- Color Schemes
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use 'rose-pine/neovim'

  -- ASCIIDOC PLUGINS 
  use 'habamax/vim-asciidoctor'

  use {'shuntaka9576/preview-asciidoc.vim',
    requires = {
  { "vim-denops/denops.vim"}
    }
  }

  -- Latex Support
  use 'lervag/vimtex'
  use 'KeitaNakamura/tex-conceal.vim'
  use 'sirver/ultisnips'

  -- Markdown Support
  use({ "plasticboy/vim-markdown", ft = { "markdown" } })
  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, }
  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  use { 'godlygeek/tabular', cmd = { "Tabularize" } }


end)
