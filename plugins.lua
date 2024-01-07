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

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- TODO: check what this guy is actually doing.
  {
    "mfussenegger/nvim-lint",
    config = function()
      require "custom.configs.nvim_lint"
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

  { import = "custom.configs.extras.diffview" },
  { import = "custom.configs.extras.mason-extras" },
  { import = "custom.configs.extras.todo-comments" },
  { import = "custom.configs.extras.trouble" },
  { import = "custom.configs.extras.typescript-tools" },


  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "telescope.nvim" },
    build = "make",
    config = function ()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufRead",
    config = true,
  },

  -- disabled plugins

  {
    "NvChad/nvterm",
    enabled = false,
  },
}

return plugins
