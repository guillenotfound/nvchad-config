local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require "custom.configs.nvim_lint"
    end,
  },

  {
    "tpope/vim-sleuth",
    event = "BufRead"
  },

  {
    "tpope/vim-surround",
    event = "BufRead",
    enabled = false
  },

  { import = "custom.configs.extras.diffview" },
  { import = "custom.configs.extras.dressing" },
  { import = "custom.configs.extras.fugitive" },
  { import = "custom.configs.extras.harpoon" },
  { import = "custom.configs.extras.mason-extras" },
  { import = "custom.configs.extras.noice" },
  { import = "custom.configs.extras.telescope" },
  { import = "custom.configs.extras.todo-comments" },
  { import = "custom.configs.extras.trouble" },
  { import = "custom.configs.extras.typescript-tools" },

  -- disabled plugins

  {
    "NvChad/nvterm",
    enabled = false,
  },
}

return plugins
