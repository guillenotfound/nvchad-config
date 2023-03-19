local au_ft = vim.api.nvim_create_augroup("ft", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "Jenkinsfile" },
  command = "set filetype=groovy",
  group = au_ft,
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local opt = vim.opt

opt.clipboard = "unnamedplus"

-- line numbers
opt.relativenumber = true
opt.number = true

opt.scrolloff = 8
