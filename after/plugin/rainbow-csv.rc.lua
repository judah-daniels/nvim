local status, rainbow_csv = pcall(require, "rainbow_csv")
if (not status) then return end

rainbow_csv.setup({})
