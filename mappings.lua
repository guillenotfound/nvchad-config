---@type MappingsTable
local M = {}

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
    ["<leader>sf"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>sg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader><leader>"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>?"] = { "<cmd> Telescope help_tags <CR>", "help page" },
  },
}

-- more keybinds!

return M
