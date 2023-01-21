local lsp = require('lsp-zero')


--
  -- K: ~ Displays hover information about the symbol under the cursor in a
  --     floating window. See |vim.lsp.buf.hover()|.
  -- gd: ~ Jumps to the definition of the symbol under the cursor.
  --     See |vim.lsp.buf.definition()|.
  -- gD: ~ Jumps to the declaration of the symbol under the cursor. Some servers
  --     don't implement this feature. See |vim.lsp.buf.declaration()|.
  -- gi: ~ Lists all the implementations for the symbol under the cursor in the
  --     quickfix window. See |vim.lsp.buf.implementation()|.
  -- go: ~
  --     Jumps to the definition of the type of the symbol under the cursor.
  --     See |vim.lsp.buf.type_definition()|.
  -- gr: ~ Lists all the references to the symbol under the cursor in the quickfix
  --     window. See |vim.lsp.buf.references()|.
  -- <Ctrl-k>: ~
  --     Displays signature information about the symbol under the cursor in a
  --     floating window. See |vim.lsp.buf.signature_help()|. If a mapping
  --     already exists for this key this function is not bound.
  -- <F2>: ~ Renames all references to the symbol under the cursor.
  --     See |vim.lsp.buf.rename()|.
  -- <F4>: ~ Selects a code action available at the current cursor position.
  --     See |vim.lsp.buf.code_action()|.
  -- gl: ~ Show diagnostic in a floating window. See |vim.diagnostic.open_float()|.
  -- [d: ~ Move to the previous diagnostic in the current buffer.
  --     See |vim.diagnostic.goto_prev()|.
  -- ]d: ~ Move to the next diagnostic. See |vim.diagnostic.goto_next()|.
  --
  --                                                   *lsp-zero-buffer-commands*
lsp.preset('recommended')
lsp.configure('haskell-language-server', { settings = { haskell = { cabalFormattingProvider = "cabalfmt", formattingProvider = "fourmolu" } } })
lsp.setup()

