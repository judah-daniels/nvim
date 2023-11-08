local status, auto_dark_mode = pcall(require, "auto-dark-mode")
if (not status) then return end

auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    SetupColor("rose-pine")
  end,
  set_light_mode = function()
    SetupColor("rose-pine-dawn")
  end,
})
