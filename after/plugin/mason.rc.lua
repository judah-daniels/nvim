local status, mason = pcall(require, "mason")
if (not status) then return end


local status2, mdap = pcall(require, "mason-nvim-dap")
if (not status2) then return end

local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
  print("nvim-dap not installed!")
  return
end

mason.setup({})

