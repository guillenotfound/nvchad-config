local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "lua",
    "markdown",
    "tsx",
    "typescript",
    "vim",
    "vue",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
}

M.mason = {
  ensure_installed = {
    "bash-language-server",
    "css-lsp",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "eslint_d",
    "gopls@v0.11.0",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "prettierd",
    "stylua",
    "tailwindcss-language-server",
    "typescript-language-server",
    "vue-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    side = "right",
    width = 35,
  }
}

M.telescope = {
  extensions_list = { "themes", "terms", "fzf", "frecency" },
  extensions = {
    frecency = {
      db_safe_mode = false,
      auto_validate = false,
    }
  }
}

return M
