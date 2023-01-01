-- import mason plugin safely
local mason_setup, mason = pcall(require, "mason")
if not mason_setup then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_setup then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_setup, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_setup then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "sumneko_lua",
    "emmet_ls",
    "intelephense",
    "gopls",
    "pylsp",
    "bashls",
    "jsonls",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "prettier", -- ts/js formatter
    "stylua", -- lua formatter
    "eslint_d", -- ts/js linter
    -- golang
    "goimports",
    "staticcheck",
    "gofumpt",
    -- golang
    "psalm", -- php
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
