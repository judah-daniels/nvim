
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

  use 'ojroques/nvim-osc52'

  use({
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    -- requires = { 'nvim-mini/mini.nvim', opt = true },            -- if you use the mini.nvim suite
    -- requires = { 'nvim-mini/mini.icons', opt = true },        -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
        require('render-markdown').setup({
          -- E-ink: the 100ms default debounce re-renders while you type.
          --
          -- anti_conceal stays ON (the default). Turning it off saves two
          -- lines of redraw per cursor move, but it also decorates the cursor
          -- line, and the icons are nerd-font private-use glyphs the Kindle
          -- terminal font has no characters for -- so the line being edited
          -- filled up with tofu. Plain text on the cursor line wins.
          debounce = 500,
        })
    end,
  })


  -- use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
 use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim"},
  config = function()
    require"startup".setup()
  end
} 

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

use({
  "obsidian-nvim/obsidian.nvim",
  tag = "*",
  config = function()
    require("obsidian").setup({
      legacy_commands = false,

      workspaces = {
        { name = "personal", path = "~/obsidian_vault" },
      },

      -- Readable filenames: "cadence-and-closure.md" rather than the default
      -- random zettel id ("1757339021-QKZP.md"), which buries the title in the
      -- frontmatter aliases. Collisions get -2, -3 appended.
      note_id_func = require("obsidian.builtin").title_id,

      -- Rewrite wikilinks when a note is renamed or moved (:Obsidian rename, or
      -- an LSP-aware file explorer). Off by default.
      link = {
        auto_update = true,
      },

      daily_notes = {
        folder = "daily_note",
        date_format = "%Y/%m-%B/%Y-%m-%d-%A",
        alias_format = "%A, %B %d, %Y",
        template = "Daily Note Template.md",
        workdays_only = false,
      },

      ui = { enable = false },

      -- Two-state checkboxes: <leader>oc goes - [ ] <-> - [x] and stops there.
      -- The default order cycles through ~, ! and > as well. Lines already in
      -- one of those states fall back to - [ ] on the next toggle.
      checkbox = {
        order = { " ", "x" },

        -- Set lists are plain lists of links, not checkbox lists. With the
        -- default (true), <CR> anywhere off a link turns the line under the
        -- cursor into "- [ ] ...", so a mistimed Enter while writing a set
        -- adds checkbox syntax you did not ask for. Toggling checkboxes that
        -- already exist still works -- that is `enabled`, not this.
        create_new = false,
      },

      templates = {
        folder = "random/templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {
          -- {{note_date}} -> the *note's own* date, e.g. "Tuesday, September 08, 2026".
          -- {{date}} is always today, which is wrong for yesterday/tomorrow notes.
          note_date = function(ctx, suffix)
            local id = ctx.partial_note and tostring(ctx.partial_note.id) or ""
            local y, m, d = id:match "^(%d%d%d%d)-(%d%d)-(%d%d)"
            if not y then
              return ""
            end
            local time = os.time { year = tonumber(y), month = tonumber(m), day = tonumber(d), hour = 12 }
            return os.date(suffix and #suffix > 0 and suffix or "%A, %B %d, %Y", time)
          end,
        },
      },
    })

    local map = vim.keymap.set
    map("n", "<leader>od", "<cmd>Obsidian today<cr>",           { desc = "Daily note" })
    map("n", "<leader>oy", "<cmd>Obsidian yesterday<cr>",       { desc = "Yesterday" })
    map("n", "<leader>oD", "<cmd>Obsidian dailies<cr>",         { desc = "Browse dailies" })
    map("n", "<leader>on", "<cmd>Obsidian new<cr>",             { desc = "New note" })
    map("n", "<leader>os", "<cmd>Obsidian search<cr>",          { desc = "Search vault" })
    map("n", "<leader>oc", "<cmd>Obsidian toggle_checkbox<cr>", { desc = "Toggle checkbox" })
    map("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>",       { desc = "Backlinks" })
    map("n", "<leader>oq", "<cmd>Obsidian quick_switch<cr>",    { desc = "Open note by name" })
    map("n", "<leader>o#", "<cmd>Obsidian tags<cr>",            { desc = "Browse tags" })
    -- Visual: pull the selection out into its own note, leaving a link behind.
    map("x", "<leader>oe", ":<C-u>Obsidian extract_note<cr>",   { desc = "Extract selection to note" })

    -- Music. Tunes and gigs have one fixed template each, so there is nothing
    -- to choose: typing the title is the whole interaction.
    --
    -- Not `:Obsidian new_from_template <path>` -- that command reads its LAST
    -- argument as the template name, so a single argument leaves the id empty
    -- and sends the tune title off to be looked up as a template. Template
    -- names contain spaces ("Tune Template"), which the same split would
    -- mangle anyway. Going through the Lua API also lets us set the aliases,
    -- which `new_from_template` never passes to Note.create.
    local Note = require "obsidian.note"
    local builtin = require "obsidian.builtin"
    local Path = require "obsidian.path"

    -- Tunes added before note_id_func are named "Georgia on My Mind.md";
    -- new ones slugify to "georgia-on-my-mind.md". On a case-sensitive
    -- filesystem those are two different files, so comparing paths would wave
    -- the duplicate straight through. Compare slugs of the existing stems.
    local function find_existing(dir, slug)
      local d = Path.new(Obsidian.dir) / dir
      if not d:exists() then
        return nil
      end
      for name, typ in vim.fs.dir(tostring(d)) do
        if typ == "file" and name:sub(-3) == ".md" and builtin.title_to_slug(name:sub(1, -4)) == slug then
          return d / name
        end
      end
    end

    local function new_music_note(dir, template)
      return function()
        vim.ui.input({ prompt = "Title: " }, function(input)
          local title = vim.trim(input or "")
          if title == "" then
            return
          end

          local slug = builtin.title_to_slug(title)

          local existing = find_existing(dir, slug)
          if existing then
            vim.notify(("Already have %s -- opening it"):format(existing.name), vim.log.levels.WARN)
            vim.cmd.edit(tostring(existing))
            return
          end

          -- verbatim skips note_id_func, whose collision handling is to
          -- quietly append -2; the check above is the guard instead. The raw
          -- title goes in as an alias so [[It could happen to you]] resolves
          -- to the slugified filename.
          local note = Note.create {
            id = ("%s/%s"):format(dir, slug),
            title = title,
            aliases = { title },
            template = template,
            verbatim = true,
          }
          note:write()
          note:open { sync = true }
        end)
      end
    end
    map("n", "<leader>oT", new_music_note("music/Tunes", "Tune Template.md"), { desc = "New tune" })
    map("n", "<leader>oG", new_music_note("music/Gigs", "Gig Template.md"), { desc = "New gig" })

    -- Writing a setlist: type [[Blues for Alice]] in a gig note and press <CR>
    -- on the link. obsidian offers
    --     [Y]es / Yes with [T]emplate / Yes as [U]nique Note / [N]o
    -- and T is the one we want -- except that stock it opens the template
    -- picker every time and, because new_notes_location is "current_dir",
    -- drops the note next to the gig in music/Gigs with no alias.
    --
    -- So intercept just that branch: within music/, a bare link is a tune, so
    -- build it in music/Tunes from Tune Template with the typed text as its
    -- alias. Everything else -- `:Obsidian new_from_template`, links outside
    -- music/, an explicitly chosen template -- falls through untouched, and
    -- obsidian's own callback still rewrites the link, so the line ends up as
    -- [[blues-for-alice|Blues for Alice]].
    local actions = require "obsidian.actions"
    local orig_new_from_template = actions.new_from_template

    actions.new_from_template = function(id, template, callback, opts)
      opts = opts or {}
      local src = opts.source_path
      local music_root = tostring(Path.new(Obsidian.dir) / "music")
      local bare = type(id) == "string" and not id:find("/", 1, true)
      local in_music = type(src) == "string" and vim.startswith(src, music_root)

      if not (template == nil and bare and in_music) then
        return orig_new_from_template(id, template, callback, opts)
      end

      local title = vim.trim(id)
      local slug = builtin.title_to_slug(title)

      -- Already have the tune, possibly still under its old Title Case name:
      -- link to it rather than making a second note.
      local note
      local existing = find_existing("music/Tunes", slug)
      if existing then
        vim.notify(("Linking to existing %s"):format(existing.name), vim.log.levels.INFO)
        note = Note.from_file(existing)
      else
        note = Note.create {
          id = ("music/Tunes/%s"):format(slug),
          title = title,
          aliases = { title },
          template = "Tune Template.md",
          verbatim = true,
        }
        note:write()
      end

      if callback then
        callback(note)
      end
    end

    -- Rep lists: the nvim equivalent of the Dataview blocks in music/Reps,
    -- which render as raw code fences here.
    map("n", "<leader>or", "<cmd>Obsidian tags status/ready status/solid<cr>", { desc = "Jam list (ready + solid)" })
    map("n", "<leader>ol", "<cmd>Obsidian tags status/learning<cr>", { desc = "Tunes: learning" })
    map("n", "<leader>oR", "<cmd>Obsidian tags status/rusty<cr>", { desc = "Tunes: needs reviving" })
  end,
})

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
  use 'ellisonleao/gruvbox.nvim'

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
  use({
    "plasticboy/vim-markdown",
    ft = { "markdown" },
    setup = function()
      -- Folding comes from nvim-ufo (LSP ranges from obsidian-ls, incl. the
      -- frontmatter). vim-markdown's heading folder re-sets foldmethod=expr on
      -- every BufWinEnter and clobbers ufo's folds, so keep it off.
      vim.g.vim_markdown_folding_disabled = 1
    end,
  })
  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, }
  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  use { 'godlygeek/tabular', cmd = { "Tabularize" } }

  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  -- DAP
  use { "nvim-neotest/nvim-nio" }
  use 'jay-babu/mason-nvim-dap.nvim'
  use { 'mfussenegger/nvim-dap', requires = 'nvim-neotest/nvim-nio' }
  use 'folke/lazydev.nvim'
  use 'rcarriga/nvim-dap-ui'

  -- Tasks
  use 'rcarriga/nvim-notify'
  use 'stevearc/dressing.nvim'
  use 'stevearc/overseer.nvim'
  use 'jamestthompson3/nvim-remote-containers'

  -- TODO LIST
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim"}

  -- QUICK FIX 
  use 'kevinhwang91/nvim-bqf'
  -- optional
  use {'junegunn/fzf', run = function()
      vim.fn['fzf#install']()

-- use { "startup-nvim/startup.nvim", requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim"} }

  end
  }


end)
