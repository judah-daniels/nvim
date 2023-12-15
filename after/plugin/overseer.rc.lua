local overseer_status, overseer = pcall(require, "overseer")
if (not overseer_status) then return end

overseer.setup()

overseer.register_template({
  -- Required fields
  name = "Build with Debugging",
  builder = function(params)
    -- This must return an overseer.TaskDefinition
    return {
      -- cmd is the only required field
      cmd = { 'cmake -DCMAKE_BUILD_TYPE=Debug . && make' },
      -- the name of the task (defaults to the cmd of the task)
      name = "Build with Debug",
      -- set the working directory for the task
    }
  end,
  -- Template definition (see below)
})

local dressing_status, dressing = pcall(require, "dressing")
if (not dressing_status) then return end

dressing.setup()
