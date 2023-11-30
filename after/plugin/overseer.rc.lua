local overseer_status, overseer = pcall(require, "overseer")
if (not overseer_status) then return end

overseer.setup()

local dressing_status, dressing = pcall(require, "dressing")
if (not dressing_status) then return end

dressing.setup()
