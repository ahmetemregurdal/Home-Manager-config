local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	print("lsp/lspconfig.lua")
	return
end

require("user.lsp.settings")
