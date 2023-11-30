local overseer_status, overseer = pcall(require, "overseer")
if (not overseer_status) then return end

local dressing_status, dressing = pcall(require, "dressing_status")
if (not dressing_status) then return end

dressing.setup()
overseer.setup()
