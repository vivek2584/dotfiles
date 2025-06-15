require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)
vim.diagnostic.config({
  underline = {

    severity = {
      min = vim.diagnostic.severity.ERROR,  -- Only underline errors, not warnings
    },
  },
})


-- read :h vim.lsp.config for changing options of lsp servers 
