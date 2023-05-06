---@type NvPluginSpec
local spec = {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleToggle" },
  config = true, -- Todo: change when base46 has colors? for this
  init = function()
    require("core.utils").load_mappings "trouble"
  end,
}

return spec
