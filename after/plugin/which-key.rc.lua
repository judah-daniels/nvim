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
whichKey.add({
    { ";", group = "Telescope" },
    { ";b", desc = "Open Recent File" },
    { ";c", "<cmd>Telescope git_branches<cr>", desc = "View Git Branches" },
    { ";f", "<cmd>Telescope git_files<cr>", desc = "Find Git File" },
    { ";r", desc = "Search all files in git rep (ripgrep)" },
    { "<C-k>", desc = "Show type signature" },
    { "<leader><Space>", desc = "Overseer Run" },
    { "<leader>ca", desc = "LSP Code Action" },
    { "<leader>dt", desc = "Debug UI Toggle" },
    { "<leader>f", desc = "LSP Format" },
    { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    { "<leader>g", desc = "Open Git" },
    { "<leader>hD", desc = "GitSigns Diff this with somthing?" },
    { "<leader>hR", desc = "GitSigns Reset Buffer" },
    { "<leader>hS", desc = "GitSigns Stage Buffer" },
    { "<leader>ha", desc = "GitSigns Stage Hunk" },
    { "<leader>hb", desc = "GitSigns Current line blame" },
    { "<leader>hd", desc = "GitSigns Diff this" },
    { "<leader>hp", desc = "GitSigns Preview Hunk" },
    { "<leader>ht", desc = "GitSigns Toggle deleted" },
    { "<leader>hu", desc = "GitSigns Undo Stage Hunk" },
    { "<leader>oa", desc = "Overseer Quick Action List" },
    { "<leader>of", desc = "Overseer Open Float" },
    { "<leader>ot", desc = "Overseer Toggle" },
    { "<leader>q", desc = "LSP list errors" },
    { "<leader>rn", desc = "LSP Rename" },
    { "<leader>u", desc = "Undotree toggle" },
    { "<leader>wl", desc = "Show workspace folders" },
    { "K", desc = "Hover LSP info" },
    { "[d", desc = "Go to previous error/ warning" },
    { "]d", desc = "Go to next error/ warning" },
    { "c", desc = "LSP Code action (ca)" },
    { "d", desc = "Debug - DAP" },
    { "gD", desc = "Show type declaration" },
    { "gd", desc = "Go to type definition" },
    { "gi", desc = "Show implementation" },
    { "gl", desc = "Open diagnostic float" },
    { "go", desc = "Show type definition" },
    { "r", desc = "LSP Rename (rn)" },
    { "sf", desc = "File Explorer" },
})
