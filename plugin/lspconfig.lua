-- LSP setup. This file lives in plugin/, so Neovim sources it automatically on
-- startup -- there is no `require` for it in init.lua.

-- must be setup before lspconfig
local lazydev_ok, lazydev = pcall(require, "lazydev")
if lazydev_ok then
  lazydev.setup({
    -- add any options here, or leave empty to use the default settings
  })
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)             -- Do this
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)              -- Do this
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                    -- Do this
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)          -- Do this
    vim.keymap.set('n', '<leader>e', ':Telescope diagnostics<CR>', opts) -- Do this
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)         -- Do this
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)       -- Do this
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
-- vim.lsp.set_log_level("debug")  -- noisy; only for debugging a server

-- Set up completion using nvim_cmp with LSP source
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_lsp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_lsp_ok then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

vim.lsp.config("clangd", {
  capabilities = capabilities,
  cmd = { "clangd",
    "--compile-commands-dir=build",
    "--header-insertion=never" }, -- ensure clangd is in your PATH or provide full path
  on_attach = function(client, bufnr)
    -- Optional: additional buffer-local config, or use what's already in your `LspAttach`
  end,
})

-- Only enable servers whose binary is actually here, so machines without them
-- (e.g. the Pi) don't error on every C/C++ buffer.
if vim.fn.executable("clangd") == 1 then
  vim.lsp.enable('clangd')
end

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    spacing = 4,
    prefix = '●',
  },
  -- Diagnostic symbols in the sign column (gutter)
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  float = {
    source = true, -- Or "if_many"
  },
})
