local linters_by_ft = {
  eslint = { "eslint_d" }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

require('lint').linters_by_ft = linters_by_ft

