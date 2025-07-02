require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)
vim.diagnostic.config({
  underline = false, 
})
-- read :h vim.lsp.config for changing options of lsp servers 
