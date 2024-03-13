local overseer_status, overseer = pcall(require, "overseer")
if (not overseer_status) then return end

overseer.setup()

-- overseer.register_template({
--   -- Required fields
--   name = "Test Functional Model",
--   builder = function(params)
--     -- This must return an overseer.TaskDefinition
--     return {
--       -- cmd is the only required field
--       cmd = { '/Users/judah/Documents/vypercore/functional-model/bin/test_fm' },
--       -- args = { '-DCMAKE_BUILD_TYPE=Debug' },
--       -- the name of the task (defaults to the cmd of the task)
--       name = "Test Functional Model",
--       -- set the working directory for the task
--       cwd = "/Users/judah/Documents/vypercore/functional-model/"
--     }
--   end,
--   -- Template definition (see below)
-- })

local dressing_status, dressing = pcall(require, "dressing")
if (not dressing_status) then return end

dressing.setup()
