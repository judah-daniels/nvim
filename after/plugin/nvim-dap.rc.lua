local status, dap = pcall(require, "nvim-dap")
if (not status) then return end

dap.setup({
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb',
    name = 'lldb' 
  }
})

