local status, whichKey = pcall(require, "which-key")
if (not status) then return end

whichKey.setup {
  plugins = {
    spelling = {
      enabled = true
    }
  }
}

-- method 3
whichKey.register({
  ["gl"] = { "Open diagnostic float" },
  ["[d"] = { "Go to previous error/ warning" },
  ["]d"] = { "Go to next error/ warning" },
  ["K"] = { "Hover LSP info" },
  ["gi"] = { "Show implementation" },
  ["go"] = { "Show type definition" },
  ["gD"] = { "Show type declaration" },
  ["gd"] = { "Go to type definition" },
  ["<C-k>"] = { "Show type signature" },
  ["<leader>wl"] = { "Show workspace folders" },
  ["<leader>rn"] = { "LSP Rename" },
  ["<leader>ca"] = { "LSP Code Action" },
  ["<leader>f"] = { "LSP Format" },
  ["<leader>q"] = { "LSP list errors" },

  ["<leader>hS"] = { "GitSigns Stage Buffer" },
  ["<leader>ha"] = { "GitSigns Stage Hunk" },
  ["<leader>hu"] = { "GitSigns Undo Stage Hunk" },
  ["<leader>hR"] = { "GitSigns Reset Buffer" },
  ["<leader>hp"] = { "GitSigns Preview Hunk" },
  ["<leader>hb"] = { "GitSigns Blame Line" },
  ["<leader>hb"] = { "GitSigns Current line blame" },
  ["<leader>hd"] = { "GitSigns Diff this" },
  ["<leader>hD"] = { "GitSigns Diff this with somthing?" },
  ["<leader>ht"] = { "GitSigns Toggle deleted" },

  [";"] = { name = "+Telescope" },
  [";f"] = { "<cmd>Telescope git_files<cr>", "Find Git File" },
  [";c"] = { "<cmd>Telescope git_branches<cr>", "View Git Branches" },
  [";b"] = { "Open Recent File" },
  [";r"] = { "Search all files in git rep (ripgrep)" },
  ["sf"] = { "File Explorer" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },

  ["<leader>u"] = { "Undotree toggle" },
  ["<leader>g"] = { "Open Git" },

  ["d"] = { "Debug - DAP" },
  ["c"] = { "LSP Code action (ca)" },
  ["r"] = { "LSP Rename (rn)" }
})
