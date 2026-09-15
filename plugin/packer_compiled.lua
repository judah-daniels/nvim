-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/judah/.cache/nvim/packer_hererocks/2.1.1774638290/share/lua/5.1/?.lua;/home/judah/.cache/nvim/packer_hererocks/2.1.1774638290/share/lua/5.1/?/init.lua;/home/judah/.cache/nvim/packer_hererocks/2.1.1774638290/lib/luarocks/rocks-5.1/?.lua;/home/judah/.cache/nvim/packer_hererocks/2.1.1774638290/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/judah/.cache/nvim/packer_hererocks/2.1.1774638290/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["denops.vim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/denops.vim",
    url = "https://github.com/vim-denops/denops.vim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["haskell-vim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/haskell-vim",
    url = "https://github.com/neovimhaskell/haskell-vim"
  },
  ["lazydev.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/lazydev.nvim",
    url = "https://github.com/folke/lazydev.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-nvim-dap.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/mason-nvim-dap.nvim",
    url = "https://github.com/jay-babu/mason-nvim-dap.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neovim = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/catgoose/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-osc52"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-osc52",
    url = "https://github.com/ojroques/nvim-osc52"
  },
  ["nvim-remote-containers"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-remote-containers",
    url = "https://github.com/jamestthompson3/nvim-remote-containers"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\nÌ\2\0\2\f\0\15\0/9\2\0\0\15\0\2\0X\3\6€6\2\1\0009\4\0\0009\4\2\4B\2\2\2\14\0\2\0X\3\1€'\2\3\0\18\5\2\0009\3\4\2'\6\5\0B\3\3\4\14\0\3\0X\6\2€'\6\3\0L\6\2\0006\6\6\0009\6\a\0065\b\t\0006\t\b\0\18\v\3\0B\t\2\2=\t\n\b6\t\b\0\18\v\4\0B\t\2\2=\t\v\b6\t\b\0\18\v\5\0B\t\2\2=\t\f\bB\6\2\0026\a\6\0009\a\r\a\15\0\1\0X\t\6€\21\t\1\0)\n\0\0\1\n\t\0X\t\2€\f\t\1\0X\t\1€'\t\14\0\18\n\6\0D\a\3\0\18%A, %B %d, %Y\tdate\bday\nmonth\tyear\1\0\4\thour\3\f\bday\0\nmonth\0\tyear\0\rtonumber\ttime\aos\30^(%d%d%d%d)-(%d%d)-(%d%d)\nmatch\5\aid\rtostring\17partial_noteþ\1\0\2\15\2\v\0,-\2\0\0009\2\0\0026\4\1\0009\4\2\4B\2\2\2#\2\0\2\18\5\2\0009\3\3\2B\3\2\2\14\0\3\0X\3\2€+\3\0\0L\3\2\0006\3\4\0009\3\5\0039\3\2\0036\5\6\0\18\a\2\0B\5\2\0A\3\0\4X\6\20€\a\a\a\0X\b\18€\18\n\6\0009\b\b\6)\výÿB\b\3\2\a\b\t\0X\b\f€-\b\1\0009\b\n\b\18\f\6\0009\n\b\6)\r\1\0)\14üÿB\n\4\0A\b\0\2\5\b\1\0X\b\2€#\b\6\2L\b\2\0E\6\3\3R\6ê\127K\0\1\0\3À\2À\18title_to_slug\b.md\bsub\tfile\rtostring\afs\bvim\vexists\bdir\rObsidian\bnewâ\3\0\1\f\5\24\0@6\1\0\0009\1\1\1\f\3\0\0X\3\1€'\3\2\0B\1\2\2\a\1\2\0X\2\1€K\0\1\0-\2\0\0009\2\3\2\18\4\1\0B\2\2\2-\3\1\0-\5\2\0\18\6\2\0B\3\3\2\15\0\3\0X\4\20€6\4\0\0009\4\4\4'\6\5\0\18\b\6\0009\6\6\0069\t\a\3B\6\3\0026\a\0\0009\a\b\a9\a\t\a9\a\n\aB\4\3\0016\4\0\0009\4\v\0049\4\f\0046\6\r\0\18\b\3\0B\6\2\0A\4\0\1K\0\1\0-\4\3\0009\4\14\0045\6\16\0'\a\15\0\18\t\a\0009\a\6\a-\n\2\0\18\v\2\0B\a\4\2=\a\17\6=\1\18\0064\a\3\0>\1\1\a=\a\19\6-\a\4\0=\a\20\6B\4\2\2\18\a\4\0009\5\21\4B\5\2\1\18\a\4\0009\5\22\0045\b\23\0B\5\3\1K\0\1\0\0\0\1\0\2\0\3\0\4\0\1\0\1\tsync\2\topen\nwrite\rtemplate\faliases\ntitle\aid\1\0\5\ntitle\0\rverbatim\2\aid\0\faliases\0\rtemplate\0\n%s/%s\vcreate\rtostring\tedit\bcmd\tWARN\vlevels\blog\tname\vformat\"Already have %s -- opening it\vnotify\18title_to_slug\5\ttrim\bvimM\1\0\4\5\5\0\a6\0\0\0009\0\1\0009\0\2\0005\2\3\0003\3\4\0B\0\3\1K\0\1\0\0\0\1\0\0À\2\0\1À\0\1\0\1\vprompt\fTitle: \ninput\aui\bvim\26\1\2\3\3\1\0\0033\2\0\0002\0\0€L\2\2\0\2À\4À\1À\0ê\5\0\4\19\5\30\0p\14\0\3\0X\4\1€4\3\0\0009\4\0\0036\5\1\0-\a\0\0009\a\2\a6\t\3\0009\t\4\tB\a\2\2'\b\5\0#\a\b\aB\5\2\0026\6\6\0\18\b\0\0B\6\2\2\a\6\a\0X\6\b€\18\b\0\0009\6\b\0'\t\t\0)\n\1\0+\v\2\0B\6\5\2\19\6\6\0X\a\3€+\6\1\0X\a\1€+\6\2\0006\a\6\0\18\t\4\0B\a\2\2\a\a\a\0X\a\6€6\a\n\0009\a\v\a\18\t\4\0\18\n\5\0B\a\3\2X\b\3€+\a\1\0X\b\1€+\a\2\0\v\1\0\0X\b\4€\15\0\6\0X\b\2€\14\0\a\0X\b\6€-\b\1\0\18\n\0\0\18\v\1\0\18\f\2\0\18\r\3\0D\b\5\0006\b\n\0009\b\f\b\18\n\0\0B\b\2\2-\t\2\0009\t\r\t\18\v\b\0B\t\2\2+\n\0\0-\v\3\0'\r\14\0\18\14\t\0B\v\3\2\15\0\v\0X\f\18€6\f\n\0009\f\15\f'\14\16\0\18\16\14\0009\14\17\0149\17\18\vB\14\3\0026\15\n\0009\15\19\0159\15\20\0159\15\21\15B\f\3\1-\f\4\0009\f\22\f\18\14\v\0B\f\2\2\18\n\f\0X\f\18€-\f\4\0009\f\23\f5\14\25\0'\15\24\0\18\17\15\0009\15\17\15\18\18\t\0B\15\3\2=\15\26\14=\b\27\0144\15\3\0>\b\1\15=\15\28\14B\f\2\2\18\n\f\0\18\14\n\0009\f\29\nB\f\2\1\15\0\2\0X\f\3€\18\f\2\0\18\14\n\0B\f\2\1K\0\1\0\3À\aÀ\2À\4À\1À\nwrite\faliases\ntitle\aid\1\0\5\ntitle\0\rverbatim\2\aid\0\faliases\0\rtemplate\21Tune Template.md\19music/Tunes/%s\vcreate\14from_file\tINFO\vlevels\blog\tname\vformat\27Linking to existing %s\vnotify\16music/Tunes\18title_to_slug\ttrim\15startswith\bvim\6/\tfind\vstring\ttype\nmusic\bdir\rObsidian\bnew\rtostring\16source_path—\17\1\0\14\0T\0•\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0005\4\4\0>\4\1\3=\3\5\0026\3\0\0'\5\6\0B\3\2\0029\3\a\3=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\16\0005\4\15\0=\4\17\3=\3\18\0025\3\19\0005\4\21\0003\5\20\0=\5\22\4=\4\23\3=\3\24\2B\0\2\0016\0\25\0009\0\26\0009\0\27\0\18\1\0\0'\3\28\0'\4\29\0'\5\30\0005\6\31\0B\1\5\1\18\1\0\0'\3\28\0'\4 \0'\5!\0005\6\"\0B\1\5\1\18\1\0\0'\3\28\0'\4#\0'\5$\0005\6%\0B\1\5\1\18\1\0\0'\3\28\0'\4&\0'\5'\0005\6(\0B\1\5\1\18\1\0\0'\3\28\0'\4)\0'\5*\0005\6+\0B\1\5\1\18\1\0\0'\3\28\0'\4,\0'\5-\0005\6.\0B\1\5\1\18\1\0\0'\3\28\0'\4/\0'\0050\0005\0061\0B\1\5\1\18\1\0\0'\3\28\0'\0042\0'\0053\0005\0064\0B\1\5\1\18\1\0\0'\3\28\0'\0045\0'\0056\0005\0067\0B\1\5\1\18\1\0\0'\0038\0'\0049\0'\5:\0005\6;\0B\1\5\0016\1\0\0'\3<\0B\1\2\0026\2\0\0'\4\6\0B\2\2\0026\3\0\0'\5=\0B\3\2\0023\4>\0003\5?\0\18\6\0\0'\b\28\0'\t@\0\18\n\5\0'\fA\0'\rB\0B\n\3\0025\vC\0B\6\5\1\18\6\0\0'\b\28\0'\tD\0\18\n\5\0'\fE\0'\rF\0B\n\3\0025\vG\0B\6\5\0016\6\0\0'\bH\0B\6\2\0029\aI\0063\bJ\0=\bI\6\18\b\0\0'\n\28\0'\vK\0'\fL\0005\rM\0B\b\5\1\18\b\0\0'\n\28\0'\vN\0'\fO\0005\rP\0B\b\5\1\18\b\0\0'\n\28\0'\vQ\0'\fR\0005\rS\0B\b\5\0012\0\0€K\0\1\0\1\0\1\tdesc\26Tunes: needs reviving(<cmd>Obsidian tags status/rusty<cr>\15<leader>oR\1\0\1\tdesc\20Tunes: learning+<cmd>Obsidian tags status/learning<cr>\15<leader>ol\1\0\1\tdesc\29Jam list (ready + solid)5<cmd>Obsidian tags status/ready status/solid<cr>\15<leader>or\0\22new_from_template\21obsidian.actions\1\0\1\tdesc\fNew gig\20Gig Template.md\15music/Gigs\15<leader>oG\1\0\1\tdesc\rNew tune\21Tune Template.md\16music/Tunes\15<leader>oT\0\0\18obsidian.path\18obsidian.note\1\0\1\tdesc\30Extract selection to note$:<C-u>Obsidian extract_note<cr>\15<leader>oe\6x\1\0\1\tdesc\16Browse tags\27<cmd>Obsidian tags<cr>\15<leader>o#\1\0\1\tdesc\22Open note by name#<cmd>Obsidian quick_switch<cr>\15<leader>oq\1\0\1\tdesc\14Backlinks <cmd>Obsidian backlinks<cr>\15<leader>ob\1\0\1\tdesc\20Toggle checkbox&<cmd>Obsidian toggle_checkbox<cr>\15<leader>oc\1\0\1\tdesc\17Search vault\29<cmd>Obsidian search<cr>\15<leader>os\1\0\1\tdesc\rNew note\26<cmd>Obsidian new<cr>\15<leader>on\1\0\1\tdesc\19Browse dailies\30<cmd>Obsidian dailies<cr>\15<leader>oD\1\0\1\tdesc\14Yesterday <cmd>Obsidian yesterday<cr>\15<leader>oy\1\0\1\tdesc\15Daily note\28<cmd>Obsidian today<cr>\15<leader>od\6n\bset\vkeymap\bvim\14templates\18substitutions\14note_date\1\0\1\14note_date\0\0\1\0\4\vfolder\21random/templates\16time_format\n%H:%M\16date_format\r%Y-%m-%d\18substitutions\0\rcheckbox\norder\1\0\2\norder\0\15create_new\1\1\3\0\0\6 \6x\aui\1\0\1\venable\1\16daily_notes\1\0\5\17alias_format\18%A, %B %d, %Y\18workdays_only\1\16date_format\25%Y/%m-%B/%Y-%m-%d-%A\vfolder\15daily_note\rtemplate\27Daily Note Template.md\tlink\1\0\1\16auto_update\2\17note_id_func\rtitle_id\21obsidian.builtin\15workspaces\1\0\2\tpath\21~/obsidian_vault\tname\rpersonal\1\0\b\17note_id_func\0\tlink\0\15workspaces\0\20legacy_commands\1\16daily_notes\0\rcheckbox\0\aui\0\14templates\0\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/obsidian-nvim/obsidian.nvim"
  },
  ["overseer.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/overseer.nvim",
    url = "https://github.com/stevearc/overseer.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["preview-asciidoc.vim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/preview-asciidoc.vim",
    url = "https://github.com/shuntaka9576/preview-asciidoc.vim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rainbow_csv.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/rainbow_csv.nvim",
    url = "https://github.com/cameron-wags/rainbow_csv.nvim"
  },
  ["render-markdown.nvim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rdebounce\3ô\3\nsetup\20render-markdown\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/judah/.local/share/nvim/site/pack/packer/opt/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["startup.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fstartup\frequire\0" },
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/startup.nvim",
    url = "https://github.com/startup-nvim/startup.nvim"
  },
  ["substitute.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/substitute.nvim",
    url = "https://github.com/gbprod/substitute.nvim"
  },
  tabular = {
    after_files = { "/home/judah/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tabularize" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/judah/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/telescope-lsp-handlers.nvim",
    url = "https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/tex-conceal.vim",
    url = "https://github.com/KeitaNakamura/tex-conceal.vim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/sirver/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-asciidoctor"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/vim-asciidoctor",
    url = "https://github.com/habamax/vim-asciidoctor"
  },
  ["vim-dafny"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/vim-dafny",
    url = "https://github.com/benknoble/vim-dafny"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-loves-dafny"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/vim-loves-dafny",
    url = "https://github.com/mlr-msft/vim-loves-dafny"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/judah/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/vim-nix",
    url = "https://github.com/LnL7/vim-nix"
  },
  ["vim-ormolu"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/vim-ormolu",
    url = "https://github.com/sdiehl/vim-ormolu"
  },
  ["vim-tmux"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/judah/.local/share/nvim/site/pack/packer/opt/vim-tmux",
    url = "https://github.com/tmux-plugins/vim-tmux"
  },
  vimtex = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/judah/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-markdown
time([[Setup for vim-markdown]], true)
try_loadstring('\27LJ\2\n?\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0"vim_markdown_folding_disabled\6g\bvim\0', "setup", "vim-markdown")
time([[Setup for vim-markdown]], false)
-- Config for: startup.nvim
time([[Config for startup.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fstartup\frequire\0", "config", "startup.nvim")
time([[Config for startup.nvim]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\nÌ\2\0\2\f\0\15\0/9\2\0\0\15\0\2\0X\3\6€6\2\1\0009\4\0\0009\4\2\4B\2\2\2\14\0\2\0X\3\1€'\2\3\0\18\5\2\0009\3\4\2'\6\5\0B\3\3\4\14\0\3\0X\6\2€'\6\3\0L\6\2\0006\6\6\0009\6\a\0065\b\t\0006\t\b\0\18\v\3\0B\t\2\2=\t\n\b6\t\b\0\18\v\4\0B\t\2\2=\t\v\b6\t\b\0\18\v\5\0B\t\2\2=\t\f\bB\6\2\0026\a\6\0009\a\r\a\15\0\1\0X\t\6€\21\t\1\0)\n\0\0\1\n\t\0X\t\2€\f\t\1\0X\t\1€'\t\14\0\18\n\6\0D\a\3\0\18%A, %B %d, %Y\tdate\bday\nmonth\tyear\1\0\4\thour\3\f\bday\0\nmonth\0\tyear\0\rtonumber\ttime\aos\30^(%d%d%d%d)-(%d%d)-(%d%d)\nmatch\5\aid\rtostring\17partial_noteþ\1\0\2\15\2\v\0,-\2\0\0009\2\0\0026\4\1\0009\4\2\4B\2\2\2#\2\0\2\18\5\2\0009\3\3\2B\3\2\2\14\0\3\0X\3\2€+\3\0\0L\3\2\0006\3\4\0009\3\5\0039\3\2\0036\5\6\0\18\a\2\0B\5\2\0A\3\0\4X\6\20€\a\a\a\0X\b\18€\18\n\6\0009\b\b\6)\výÿB\b\3\2\a\b\t\0X\b\f€-\b\1\0009\b\n\b\18\f\6\0009\n\b\6)\r\1\0)\14üÿB\n\4\0A\b\0\2\5\b\1\0X\b\2€#\b\6\2L\b\2\0E\6\3\3R\6ê\127K\0\1\0\3À\2À\18title_to_slug\b.md\bsub\tfile\rtostring\afs\bvim\vexists\bdir\rObsidian\bnewâ\3\0\1\f\5\24\0@6\1\0\0009\1\1\1\f\3\0\0X\3\1€'\3\2\0B\1\2\2\a\1\2\0X\2\1€K\0\1\0-\2\0\0009\2\3\2\18\4\1\0B\2\2\2-\3\1\0-\5\2\0\18\6\2\0B\3\3\2\15\0\3\0X\4\20€6\4\0\0009\4\4\4'\6\5\0\18\b\6\0009\6\6\0069\t\a\3B\6\3\0026\a\0\0009\a\b\a9\a\t\a9\a\n\aB\4\3\0016\4\0\0009\4\v\0049\4\f\0046\6\r\0\18\b\3\0B\6\2\0A\4\0\1K\0\1\0-\4\3\0009\4\14\0045\6\16\0'\a\15\0\18\t\a\0009\a\6\a-\n\2\0\18\v\2\0B\a\4\2=\a\17\6=\1\18\0064\a\3\0>\1\1\a=\a\19\6-\a\4\0=\a\20\6B\4\2\2\18\a\4\0009\5\21\4B\5\2\1\18\a\4\0009\5\22\0045\b\23\0B\5\3\1K\0\1\0\0\0\1\0\2\0\3\0\4\0\1\0\1\tsync\2\topen\nwrite\rtemplate\faliases\ntitle\aid\1\0\5\ntitle\0\rverbatim\2\aid\0\faliases\0\rtemplate\0\n%s/%s\vcreate\rtostring\tedit\bcmd\tWARN\vlevels\blog\tname\vformat\"Already have %s -- opening it\vnotify\18title_to_slug\5\ttrim\bvimM\1\0\4\5\5\0\a6\0\0\0009\0\1\0009\0\2\0005\2\3\0003\3\4\0B\0\3\1K\0\1\0\0\0\1\0\0À\2\0\1À\0\1\0\1\vprompt\fTitle: \ninput\aui\bvim\26\1\2\3\3\1\0\0033\2\0\0002\0\0€L\2\2\0\2À\4À\1À\0ê\5\0\4\19\5\30\0p\14\0\3\0X\4\1€4\3\0\0009\4\0\0036\5\1\0-\a\0\0009\a\2\a6\t\3\0009\t\4\tB\a\2\2'\b\5\0#\a\b\aB\5\2\0026\6\6\0\18\b\0\0B\6\2\2\a\6\a\0X\6\b€\18\b\0\0009\6\b\0'\t\t\0)\n\1\0+\v\2\0B\6\5\2\19\6\6\0X\a\3€+\6\1\0X\a\1€+\6\2\0006\a\6\0\18\t\4\0B\a\2\2\a\a\a\0X\a\6€6\a\n\0009\a\v\a\18\t\4\0\18\n\5\0B\a\3\2X\b\3€+\a\1\0X\b\1€+\a\2\0\v\1\0\0X\b\4€\15\0\6\0X\b\2€\14\0\a\0X\b\6€-\b\1\0\18\n\0\0\18\v\1\0\18\f\2\0\18\r\3\0D\b\5\0006\b\n\0009\b\f\b\18\n\0\0B\b\2\2-\t\2\0009\t\r\t\18\v\b\0B\t\2\2+\n\0\0-\v\3\0'\r\14\0\18\14\t\0B\v\3\2\15\0\v\0X\f\18€6\f\n\0009\f\15\f'\14\16\0\18\16\14\0009\14\17\0149\17\18\vB\14\3\0026\15\n\0009\15\19\0159\15\20\0159\15\21\15B\f\3\1-\f\4\0009\f\22\f\18\14\v\0B\f\2\2\18\n\f\0X\f\18€-\f\4\0009\f\23\f5\14\25\0'\15\24\0\18\17\15\0009\15\17\15\18\18\t\0B\15\3\2=\15\26\14=\b\27\0144\15\3\0>\b\1\15=\15\28\14B\f\2\2\18\n\f\0\18\14\n\0009\f\29\nB\f\2\1\15\0\2\0X\f\3€\18\f\2\0\18\14\n\0B\f\2\1K\0\1\0\3À\aÀ\2À\4À\1À\nwrite\faliases\ntitle\aid\1\0\5\ntitle\0\rverbatim\2\aid\0\faliases\0\rtemplate\21Tune Template.md\19music/Tunes/%s\vcreate\14from_file\tINFO\vlevels\blog\tname\vformat\27Linking to existing %s\vnotify\16music/Tunes\18title_to_slug\ttrim\15startswith\bvim\6/\tfind\vstring\ttype\nmusic\bdir\rObsidian\bnew\rtostring\16source_path—\17\1\0\14\0T\0•\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0005\4\4\0>\4\1\3=\3\5\0026\3\0\0'\5\6\0B\3\2\0029\3\a\3=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\16\0005\4\15\0=\4\17\3=\3\18\0025\3\19\0005\4\21\0003\5\20\0=\5\22\4=\4\23\3=\3\24\2B\0\2\0016\0\25\0009\0\26\0009\0\27\0\18\1\0\0'\3\28\0'\4\29\0'\5\30\0005\6\31\0B\1\5\1\18\1\0\0'\3\28\0'\4 \0'\5!\0005\6\"\0B\1\5\1\18\1\0\0'\3\28\0'\4#\0'\5$\0005\6%\0B\1\5\1\18\1\0\0'\3\28\0'\4&\0'\5'\0005\6(\0B\1\5\1\18\1\0\0'\3\28\0'\4)\0'\5*\0005\6+\0B\1\5\1\18\1\0\0'\3\28\0'\4,\0'\5-\0005\6.\0B\1\5\1\18\1\0\0'\3\28\0'\4/\0'\0050\0005\0061\0B\1\5\1\18\1\0\0'\3\28\0'\0042\0'\0053\0005\0064\0B\1\5\1\18\1\0\0'\3\28\0'\0045\0'\0056\0005\0067\0B\1\5\1\18\1\0\0'\0038\0'\0049\0'\5:\0005\6;\0B\1\5\0016\1\0\0'\3<\0B\1\2\0026\2\0\0'\4\6\0B\2\2\0026\3\0\0'\5=\0B\3\2\0023\4>\0003\5?\0\18\6\0\0'\b\28\0'\t@\0\18\n\5\0'\fA\0'\rB\0B\n\3\0025\vC\0B\6\5\1\18\6\0\0'\b\28\0'\tD\0\18\n\5\0'\fE\0'\rF\0B\n\3\0025\vG\0B\6\5\0016\6\0\0'\bH\0B\6\2\0029\aI\0063\bJ\0=\bI\6\18\b\0\0'\n\28\0'\vK\0'\fL\0005\rM\0B\b\5\1\18\b\0\0'\n\28\0'\vN\0'\fO\0005\rP\0B\b\5\1\18\b\0\0'\n\28\0'\vQ\0'\fR\0005\rS\0B\b\5\0012\0\0€K\0\1\0\1\0\1\tdesc\26Tunes: needs reviving(<cmd>Obsidian tags status/rusty<cr>\15<leader>oR\1\0\1\tdesc\20Tunes: learning+<cmd>Obsidian tags status/learning<cr>\15<leader>ol\1\0\1\tdesc\29Jam list (ready + solid)5<cmd>Obsidian tags status/ready status/solid<cr>\15<leader>or\0\22new_from_template\21obsidian.actions\1\0\1\tdesc\fNew gig\20Gig Template.md\15music/Gigs\15<leader>oG\1\0\1\tdesc\rNew tune\21Tune Template.md\16music/Tunes\15<leader>oT\0\0\18obsidian.path\18obsidian.note\1\0\1\tdesc\30Extract selection to note$:<C-u>Obsidian extract_note<cr>\15<leader>oe\6x\1\0\1\tdesc\16Browse tags\27<cmd>Obsidian tags<cr>\15<leader>o#\1\0\1\tdesc\22Open note by name#<cmd>Obsidian quick_switch<cr>\15<leader>oq\1\0\1\tdesc\14Backlinks <cmd>Obsidian backlinks<cr>\15<leader>ob\1\0\1\tdesc\20Toggle checkbox&<cmd>Obsidian toggle_checkbox<cr>\15<leader>oc\1\0\1\tdesc\17Search vault\29<cmd>Obsidian search<cr>\15<leader>os\1\0\1\tdesc\rNew note\26<cmd>Obsidian new<cr>\15<leader>on\1\0\1\tdesc\19Browse dailies\30<cmd>Obsidian dailies<cr>\15<leader>oD\1\0\1\tdesc\14Yesterday <cmd>Obsidian yesterday<cr>\15<leader>oy\1\0\1\tdesc\15Daily note\28<cmd>Obsidian today<cr>\15<leader>od\6n\bset\vkeymap\bvim\14templates\18substitutions\14note_date\1\0\1\14note_date\0\0\1\0\4\vfolder\21random/templates\16time_format\n%H:%M\16date_format\r%Y-%m-%d\18substitutions\0\rcheckbox\norder\1\0\2\norder\0\15create_new\1\1\3\0\0\6 \6x\aui\1\0\1\venable\1\16daily_notes\1\0\5\17alias_format\18%A, %B %d, %Y\18workdays_only\1\16date_format\25%Y/%m-%B/%Y-%m-%d-%A\vfolder\15daily_note\rtemplate\27Daily Note Template.md\tlink\1\0\1\16auto_update\2\17note_id_func\rtitle_id\21obsidian.builtin\15workspaces\1\0\2\tpath\21~/obsidian_vault\tname\rpersonal\1\0\b\17note_id_func\0\tlink\0\15workspaces\0\20legacy_commands\1\16daily_notes\0\rcheckbox\0\aui\0\14templates\0\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd render-markdown.nvim ]]

-- Config for: render-markdown.nvim
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rdebounce\3ô\3\nsetup\20render-markdown\frequire\0", "config", "render-markdown.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Tabularize', function(cmdargs)
          require('packer.load')({'tabular'}, { cmd = 'Tabularize', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'tabular'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Tabularize ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tmux ++once lua require("packer.load")({'vim-tmux'}, { ft = "tmux" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/judah/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]], true)
vim.cmd [[source /home/judah/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]]
time([[Sourcing ftdetect script at: /home/judah/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]], false)
time([[Sourcing ftdetect script at: /home/judah/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/judah/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/judah/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
