local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "rust_analyzer", "lua_ls", "gopls" }

local attach = function(client, bufnr)
  on_attach(client, bufnr)

  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts "Hover")

  vim.keymap.set("n", "gd", "<cmd> Telescope <CR>", { buffer = bufnr })
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
-- Without the loop, you would have to manually set up each LSP
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

local bkp = {
  html = {},
  awk_ls = {},
  bashls = {},
  rust_analyzer = {},
  gopls = {
    settings = {
      gopls = {
        staticcheck = true,
        gofumpt = true,
        usePlaceholders = true,
        analyses = {
          unusedvariable = true,
          shadow = true,
        },
      },
    },
  },
}
