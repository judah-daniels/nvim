local nvimdap, bufferline = pcall(require, "mason-nvim-dap")
if (not status) then return end

nvimdap.setup()

