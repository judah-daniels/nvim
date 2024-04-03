local overseer_status, overseer = pcall(require, "overseer")
if (not overseer_status) then return end

overseer.setup()

overseer.register_template({
  -- Required fields
  name = "Test Functional Model",
  builder = function(params)
    -- This must return an overseer.TaskDefinition
    return {
      -- cmd is the only required field
      cmd = { 'bin/shell', 'poetry', 'run','cmake','--build','build_ninja','--target','run_test', '&&', './build_ninja/run_test'},
      -- the name of the task (defaults to the cmd of the task)
      name = "Test Functional Model",
      -- set the working directory for the task
      cwd = "/Volumes/CaseSensitive/vypercore/functional-model"
    }
  end,
  -- Template definition (see below)
})

local dressing_status, dressing = pcall(require, "dressing")
if (not dressing_status) then return end

dressing.setup()
