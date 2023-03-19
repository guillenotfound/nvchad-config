local M = {}

M.treesitter = {
  ensure_installed = {
    "css",
    "dockerfile",
    "html",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
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
    "html-lsp",
    "lua-language-server",
    "prettierd",
    "stylua",
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
}

return M
