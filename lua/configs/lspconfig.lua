local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "rust_analyzer", "lua_ls", "gopls", "tsserver", "eslint" }

local attach = function(client, bufnr)
  on_attach(client, bufnr)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr, desc = "LSP References" })
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { buffer = bufnr, desc = "LSP References" })
  vim.keymap.set(
    "n",
    "gD",
    "<cmd>Telescope lsp_type_definitions<cr>",
    { buffer = bufnr, desc = "LSP Type definitions" }
  )
  vim.keymap.set(
    "n",
    "<leader>fs",
    "<cmd>Telescope lsp_document_symbols<cr>",
    { buffer = bufnr, desc = "LSP Document symbols" }
  )
  vim.keymap.set(
    "n",
    "<leader>fd",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    { buffer = bufnr, desc = "LSP Dynamic workspace symbols" }
  )

  -- Diagnostics
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = bufnr, desc = "LSP Open diagnostic" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "LSP Next diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "LSP Previous diagnostic" })
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = attach,
    capabilities = capabilities,
  }
end

require("lspconfig").gopls.setup {
  on_init = on_init,
  on_attach = attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
    },
  },
}
