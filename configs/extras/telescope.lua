local overrides = require("custom.configs.overrides")

---@type NvPluginSpec
local spec = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-frecency.nvim"
  },
  opts = overrides.telescope,
}

return spec
