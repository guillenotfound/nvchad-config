---@type MappingsTable
local M = {}

M.disabled = {
  n = {
     ["<C-n>"] = "",
  }
}

M.general = {
  i = {
    ["<C-d>"] = { "<Del>", "forward delete" },

    ["<esc>"] = { "<Nop>", "disable Esc to exit insert mode" },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

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
  },
  v = {
    [">"] = { ">gv", "indent"},

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
    ["<leader>ds"] = { "<cmd> Telescope lsp_document_symbols <CR>", "[D]ocument [S]ymbols" },
    ["<leader><leader>"] = { "<cmd> Telescope buffers <CR>", "[ ] Find existing buffers" },
    ["<leader>swf"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "[/] Fuzzily search in current buffer" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>b"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

-- more keybinds!

return M
