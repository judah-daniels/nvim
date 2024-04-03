local status, mason = pcall(require, "mason")
if (not status) then return end


local status2, mdap = pcall(require, "mason-nvim-dap")
if (not status2) then return end

local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
  print("nvim-dap not installed!")
  return
end

require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.adapters.dockergdb = {
  type = 'executable',
  command = '/Volumes/CaseSensitive/vypercore/functional-model/bin/shell', -- adjust as needed, must be absolute path
  args = {'gdb', '/work/repo/build_ninja/run_test'}, -- adjust as needed, must be absolute path
  name = 'dockergdb'
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "dockergdb",
    request = "launch",
    -- program = "/work/repo/build_ninja/run_test",
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = true,
  }
}

mason.setup({})

require("mason-nvim-dap").setup({
  automatic_setup = true,
})


local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
