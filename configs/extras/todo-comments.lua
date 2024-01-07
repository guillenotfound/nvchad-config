---@type NvPluginSpec
local spec = {
  "folke/todo-comments.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "BufRead",
  init = function()
    require("core.utils").load_mappings "todo_comments"
  end,
}


return spec
