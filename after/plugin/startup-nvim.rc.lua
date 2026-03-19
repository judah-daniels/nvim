local status, autopairs = pcall(require, "startup")
if (not status) then return end

autopairs.setup()

