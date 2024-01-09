---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<C-c>"] = "",
  },
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

    ["x"] = { '"_x' },

    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    ["<leader>|"] = { "<C-w>v" },
    ["<leader>-"] = { "<C-w>s" },

    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] },

    -- disable direction keys
    ["<up>"] = { "<Nop>" },
    ["<down>"] = { "<Nop>" },
    ["<left>"] = { "<Nop>" },
    ["<right>"] = { "<Nop>" },
  },
  v = {
    [">"] = { ">gv", "indent"},

    ["x"] = { '"_x' },

    ["J"] = { ":m '>+1<CR>gv=gv" },
    ["K"] = { ":m '<-2<CR>gv=gv" },
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
    ["<leader>ff"] = { "<cmd> Telescope frecency workspace=CWD <CR>", "[F]ind [F]iles" },
    ["<leader>fww"] = { function ()
      local word = vim.fn.expand("<cword>")
      require('telescope.builtin').grep_string({ search = word })
    end, "Grep word under cursor" },
    ["<leader>fW"] = { function ()
      local word = vim.fn.expand("<cWORD>")
      require('telescope.builtin').grep_string({ search = word })
    end, "Grep WORD under cursor" },
    ["<leader>sd"] = { "<cmd> Telescope diagnostics <CR>", "[S]earch [D]iagnostics" },
    ["<leader>ds"] = { "<cmd> Telescope lsp_document_symbols <CR>", "[D]ocument [S]ymbols" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>b"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.trouble = {
  plugin = true,

  n = {
    ["<leader>tx"] = { "<cmd>TroubleToggle<cr>" },
    ["<leader>tw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>" },
    ["<leader>td"] = { "<cmd>TroubleToggle document_diagnostics<cr>" },
    ["<leader>tl"] = { "<cmd>TroubleToggle loclist<cr>" },
    ["<leader>tq"] = { "<cmd>TroubleToggle quickfix<cr>" },
    ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>" },
  },
}

M.todo_comments = {
  plugin = true,

  n = {
    ["]t"] = { ":lua require('todo-comments').jump_next()<cr>", "Next todo commnent" },
    ["[t"] = { ":lua require('todo-comments').jump_prev()<cr>", "Previous todo commnent" },
    ["<leader>ft"] = { "<cmd>TodoTelescope<cr>", "[F]ind [T]ODO" },
  },
}

return M
