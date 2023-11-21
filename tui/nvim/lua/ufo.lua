local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
	print("ufo.lua")
	return
end

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	require("lspconfig")[ls].setup({
		capabilities = capabilities,
		-- you can add other fields for setting up lsp server in this table
	})
end
ufo.setup({
	open_fold_hl_timeout = 400,
	provider_selector = nil,
	close_fold_kinds = {},
	fold_virt_text_handler = nil,
	enable_get_fold_virt_text = false,
})
