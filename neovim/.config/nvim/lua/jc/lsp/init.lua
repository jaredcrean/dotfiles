local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- require("jc.lsp.lsp-installer")
require("jc.lsp.handlers").setup()
require("jc.lsp.null-ls")
require("jc.lsp.lspconfig")
-- require "jc.lsp.bashls"
-- require'lspconfig'.terraform_lsp.setup{}
