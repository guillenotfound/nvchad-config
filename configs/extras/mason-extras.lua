local setup = function(_, opts)
  local on_attach = require("plugins.configs.lspconfig").on_attach
  local capabilities = require("plugins.configs.lspconfig").capabilities

  local lspconfig = require "lspconfig"
  local util = require "lspconfig/util"

  -- List of servers to install
  local servers = {
    "bashls",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "eslint",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "tailwindcss",
    "volar",
  }

  require("mason").setup(opts)

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }

  -- This will setup lsp for servers you listed above
  -- And servers you install through mason UI
  -- So defining servers in the list above is optional
  require("mason-lspconfig").setup_handlers {
    -- Default setup for all servers, unless a custom one is defined below
    function(server_name)
      lspconfig[server_name].setup {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          -- Add your other things here
          -- Example being format on save or something
        end,
        capabilities = capabilities,
      }
    end,
    -- custom setup for a server goes after the function above
    -- Example, override rust_analyzer
    -- ["rust_analyzer"] = function ()
    --   require("rust-tools").setup {}
    -- end,

    -- Example: disable auto configuring an LSP
    -- Here, we disable lua_ls so we can use NvChad's default config
    ["lua_ls"] = function() end,

    ["eslint"] = function ()
      lspconfig.eslint.setup {
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
        capabilities = capabilities,
      }
    end,

    ["gopls"] = function ()
      lspconfig.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"gopls"},
        cmd_env = {
          GOFLAGS = "-tags=test,e2e_test,integration_test,acceptance_test",
        },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      }
    end,

    ["jsonls"] = function()
      lspconfig.jsonls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          json = {
            validate = { enable = true },
            schemas = {
              {
                fileMatch = { 'package.json' },
                url = 'https://json.schemastore.org/package.json',
              },
              {
                description = "TypeScript compiler configuration file",
                fileMatch = { "tsconfig.json", "tsconfig.*.json" },
                url = "http://json.schemastore.org/tsconfig",
              },
              {
                description = "Lerna config",
                fileMatch = { "lerna.json" },
                url = "http://json.schemastore.org/lerna",
              },
              {
                description = "Babel configuration",
                fileMatch = { ".babelrc.json", ".babelrc", "babel.config.json" },
                url = "http://json.schemastore.org/lerna",
              },
              {
                description = "ESLint config",
                fileMatch = { ".eslintrc.json", ".eslintrc" },
                url = "http://json.schemastore.org/eslintrc",
              },
              {
                description = "Prettier config",
                fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
                url = "http://json.schemastore.org/prettierrc",
              },
              {
                description = "Stylelint config",
                fileMatch = { ".stylelintrc", ".stylelintrc.json", "stylelint.config.json" },
                url = "http://json.schemastore.org/stylelintrc",
              },
            },
          },
        },
      }
    end,

    ["tailwindcss"] = function ()
      lspconfig.tailwindcss.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "vue" }
      }
    end,
  }
end

---@type NvPluginSpec
local spec = {
  "neovim/nvim-lspconfig",
  -- BufRead is to make sure if you do nvim some_file then this is still going to be loaded
  event = { "VeryLazy", "BufRead" },
  config = function() end, -- Override to make sure load order is correct
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = function(plugin, opts)
        setup(plugin, opts)
      end,
    },
    "williamboman/mason-lspconfig",
    {
      "folke/neodev.nvim",
      config = true,
    },
  },
}

return spec
