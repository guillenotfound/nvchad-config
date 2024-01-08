local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

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

  -- disabled plugins

  {
    "NvChad/nvterm",
    enabled = false,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    config = true,
    event = "InsertEnter",
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- Git related
  { "tpope/vim-fugitive", event = "VeryLazy" },

  { "tpope/vim-rhubarb", event = "VeryLazy" },

  {
    "tommcdo/vim-fubitive",
    config = function()
      vim.g.fubitive_domain_pattern = "bitbucket.corp.zscaler.com"
    end,
    event = "VeryLazy",
  },

  { "tpope/vim-sleuth", event = "BufRead" },

  { "tpope/vim-surround", event = "BufRead" },

  {
    "folke/todo-comments.nvim",
    config = true,
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- { import = "custom.configs.extras.copilot" },
  { import = "custom.configs.extras.diffview" },
  { import = "custom.configs.extras.mason-extras" },
  { import = "custom.configs.extras.trouble" },
}

return plugins
