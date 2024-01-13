---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  transparency = true,

  hl_override = highlights.override,
  hl_add = highlights.add,

  -- Remove gap when using nvim-tree on the right side
  tabufline = {
    overriden_modules = function(modules)
       table.insert(modules, modules[1])
       table.remove(modules, 1)
    end,
  },
}

M.ui.extended_integrations = { "notify", "trouble", "todo" }

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
