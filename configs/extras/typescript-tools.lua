---@type NvPluginSpec
local spec = {
  "pmizio/typescript-tools.nvim",
  event = "BufRead",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function ()
    local on_attach = require("plugins.configs.lspconfig").on_attach
    require("typescript-tools").setup {
      on_attach = on_attach,
      settings = {
        separate_diagnostic_server = false,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = 'all',
      }
    }
  end,
}

return spec
