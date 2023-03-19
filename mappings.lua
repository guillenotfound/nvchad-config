---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["<C-d>"] = { "<Del>", "forward delete" },
  },
  n = {
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },

    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    ["<leader>|"] = { "<C-w>v" },
    ["<leader>-"] = { "<C-w>s" },

    -- disable direction keys
    ["<up>"] = { "<Nop>" },
    ["<down>"] = { "<Nop>" },
    ["<left>"] = { "<Nop>" },
    ["<right>"] = { "<Nop>" },

    ["<leader>rn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "lsp rename",
    },
  },
  v = {
    ["K"] = { ":m '<-2<CR>gv=gv" },
    ["J"] = { ":m '>+1<CR>gv=gv" },
    ["<A-j>"] = { ":m .+1<CR>==" },
    ["<A-k>"] = { ":m .-2<CR>==" },
  },
  x = {
    ["J"] = { ":move '>+1<CR>gv-gv" },
    ["K"] = { ":move '<-2<CR>gv-gv" },
    ["<A-j>"] = { ":move '>+1<CR>gv-gv" },
    ["<A-k>"] = { ":move '<-2<CR>gv-gv" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>sf"] = { "<cmd> Telescope find_files <CR>", "[S]earch [F]iles" },
    ["<leader>sg"] = { "<cmd> Telescope live_grep <CR>", "[S]earch by [G]rep" },
    ["<leader>sd"] = { "<cmd> Telescope diagnostics <CR>", "[S]earch [D]iagnostics" },
    ["<leader><leader>"] = { "<cmd> Telescope buffers <CR>", "[ ] Find existing buffers" },
  },
}

-- more keybinds!

return M
