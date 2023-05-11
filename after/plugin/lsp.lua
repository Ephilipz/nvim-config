local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'lua-ls',
	'tsserver',
	'eslint',
	'rust_analyzer',
	'cssls'
})

-- -- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

-- format on save
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	command = 'lua vim.lsp.buf.format()'
})
