local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  return
end

local luasnip_setup, luasnip = pcall(require, "luasnip")
if not luasnip_setup then
  return
end

-- import lspkind plugin safely
local lspkind_setup, lspkind = pcall(require, "lspkind")
if not lspkind_setup then
  return
end

-- load friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- previous suggestion
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- next suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- show completion suggestions
    ["<C-c>"] = cmp.mapping.complete(),
    -- close completion window
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    -- lsp
    { name = "nvim_lsp" },
    -- snippets
    { name = "luasnip" },
    -- text within current buffer
    { name = "buffer" },
    -- file system paths
    { name = "path" },
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
