-- nvim-treesitter (main branch). Highlighting is done by Neovim itself via
-- vim.treesitter.start(); the plugin only installs parsers and queries.
--
-- Parsers are compiled with the tree-sitter CLI (>= 0.26 required). The system
-- one is too old, so prefer the one installed from this repo's package.json
-- (npm install) when it exists.
local ts_bin = vim.fn.stdpath('config') .. '/node_modules/.bin'
if vim.uv.fs_stat(ts_bin .. '/tree-sitter') and not vim.env.PATH:find(ts_bin, 1, true) then
  vim.env.PATH = ts_bin .. ':' .. vim.env.PATH
end

local status, ts = pcall(require, "nvim-treesitter")
if (not status) then return end

-- Parsers that should always be present. Installed asynchronously on startup
-- if missing; :TSUpdate (run by packer after updates) keeps them current.
local ensure_installed = {
  "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "tsx",
  "toml",
  "fish",
  "php",
  "json",
  "yaml",
  "css",
  "html",
  "haskell",
  "latex",
  "rust",
}

local installed = ts.get_installed()
local missing = vim.tbl_filter(function(lang)
  return not vim.list_contains(installed, lang)
end, ensure_installed)
if #missing > 0 then
  ts.install(missing)
end

local max_filesize = 100 * 1024 -- skip treesitter highlighting for files over 100 KB
local install_attempted = {}

local function start_highlight(buf, lang)
  local ok, err = pcall(vim.treesitter.start, buf, lang)
  if not ok then
    vim.notify_once(("treesitter: could not start for %s: %s"):format(lang, err), vim.log.levels.WARN)
  end
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('user_treesitter', { clear = true }),
  desc = 'Treesitter highlighting; auto-installs a missing parser on first use',
  callback = function(args)
    local buf = args.buf
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then return end

    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then return end

    if vim.treesitter.language.add(lang) then
      start_highlight(buf, lang)
      return
    end

    -- Parser not installed: install it once, then start highlighting.
    if install_attempted[lang] then return end
    install_attempted[lang] = true
    if not vim.list_contains(ts.get_available(), lang) then return end

    ts.install(lang):await(function(err)
      if err then return end
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(buf) and vim.treesitter.language.add(lang) then
          start_highlight(buf, lang)
        end
      end)
    end)
  end,
})
