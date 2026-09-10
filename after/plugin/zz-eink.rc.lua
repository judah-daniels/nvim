-- E-ink overrides for plugins that repaint on their own schedule.
--
-- Named zz-* so it is sourced last of the after/plugin files (they load in
-- alphabetical order) and can amend the setup calls made in the others.
-- Switched off with lua/eink.lua.
if not vim.g.eink then return end

-- lualine.
--
-- 'progress' and 'location' change on every cursor move, so the statusline
-- repaints as you move around; mode, branch and filename only change when
-- something actually happens.
--
-- The theme is spelled out rather than left on 'auto': asked to derive a
-- statusline from the mono colourscheme, lualine produced sections measuring
-- 1.5:1 to 3:1 against their own text. These four tones are the same
-- xterm-256 greys colors/eink.lua uses, and no mode gets its own colour --
-- there is no colour to give it.
local mono = {
  a = { fg = '#000000', bg = '#bcbcbc', gui = 'bold' },
  b = { fg = '#000000', bg = '#d0d0d0' },
  c = { fg = '#000000', bg = '#e4e4e4' },
}
local mono_inactive = {
  a = { fg = '#585858', bg = '#eeeeee' },
  b = { fg = '#585858', bg = '#eeeeee' },
  c = { fg = '#585858', bg = '#eeeeee' },
}
local theme = {
  normal = mono, insert = mono, visual = mono, replace = mono,
  command = mono, terminal = mono, inactive = mono_inactive,
}

local ok, lualine = pcall(require, 'lualine')
if ok then
  local cfg = lualine.get_config()
  cfg.options.theme = theme
  -- Devicons colour the filetype icon by language, which greyscales to a
  -- 2.2:1 smudge -- and the icons are nerd-font glyphs this terminal has no
  -- characters for anyway.
  cfg.options.icons_enabled = false
  cfg.sections.lualine_y = {}
  cfg.sections.lualine_z = {}
  cfg.inactive_sections.lualine_x = {}
  -- Same reason the diagnostic/task symbols are spelled with letters: the
  -- configured ones are private-use glyphs that arrive as tofu.
  local x = {
    { 'diagnostics', sources = { 'nvim_diagnostic' },
      symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' } },
    'filetype',
  }
  local ok_ov, overseer = pcall(require, 'overseer')
  if ok_ov then
    table.insert(x, 1, { 'overseer', label = '', colored = false, symbols = {
      [overseer.STATUS.FAILURE] = 'F:',
      [overseer.STATUS.CANCELED] = 'C:',
      [overseer.STATUS.SUCCESS] = 'S:',
      [overseer.STATUS.RUNNING] = 'R:',
    } })
  end
  cfg.sections.lualine_x = x
  lualine.setup(cfg)
end

-- nvim-cmp: the popup dirties a large block of screen on every keystroke while
-- typing. Manual trigger only -- <C-Space> is already mapped to cmp.complete()
-- in cmp.rc.lua. Delete this block to get the popup back automatically.
local ok_cmp, cmp = pcall(require, 'cmp')
if ok_cmp then
  cmp.setup({ completion = { autocomplete = false } })

  -- Markdown is the exception. Obsidian serves wikilink/tag completion over
  -- its in-process LSP (obsidian-ls), and having to reach for <C-Space> after
  -- every '[[' makes linking notes together too slow to bother with. The
  -- popup only opens once a trigger character has been typed, so the cost is
  -- confined to the few keystrokes it takes to pick a note.
  cmp.setup.filetype('markdown', {
    completion = {
      autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
    },
  })
end
