-- Convert the cwd to a simple file name
local function get_cwd_as_name()
  local dir = vim.fn.getcwd(0)
  return dir:gsub("[^A-Za-z0-9]", "_")
end

local overseer_status, overseer = pcall(require, "overseer")
if (not overseer_status) then return end

overseer.setup()

local dressing_status, dressing = pcall(require, "dressing")
if (not dressing_status) then return end

dressing.setup()
