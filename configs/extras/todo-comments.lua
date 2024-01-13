---@type NvPluginSpec
local spec = {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "BufRead",
  config = function()
    dofile(vim.g.base46_cache .. "todo")
    require("core.utils").load_mappings "todo_comments"
    require("todo-comments").setup()
  end,
}


return spec
