-- Neovim 0.11+ native LSP configuration (replaces nvim-lspconfig)

vim.lsp.config("ts_ls", {
  cmd = { "bun", "run", "--bun", "typescript-language-server", "--stdio" },
})
vim.lsp.enable("ts_ls")

-- Uncomment to enable Terraform LSP:
-- vim.lsp.enable("terraformls")
--
-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--   pattern = {"*.tf", "*.tfvars"},
--   callback = vim.lsp.buf.format
-- })
