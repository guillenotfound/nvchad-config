---@type NvPluginSpec
local spec = {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleToggle" },
  init = function()
    require("core.utils").load_mappings "trouble"
  end,
}

return spec
