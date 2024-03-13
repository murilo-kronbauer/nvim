local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- lsp_zero.default_keymaps({ buffer = bufnr, exclude = { '<F2>' }})

	-- see :help lsp-zero-keybinding
	-- to learn the available actions
	local opts = { buffer = bufnr }


	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)

	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

	vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
	-- vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'eslint',
		'lua_ls',
		'rust_analyzer'
	},
	handlers = {
		lsp_zero.default_setup,
	},
})
