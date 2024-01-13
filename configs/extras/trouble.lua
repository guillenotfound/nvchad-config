---@type NvPluginSpec
local spec = {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleToggle" },
  config = function()
    dofile(vim.g.base46_cache .. "trouble")
    require("core.utils").load_mappings "trouble"
    require("trouble").setup()
  end,
}

return spec
