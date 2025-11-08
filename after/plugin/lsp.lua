local lsp = require("lsp-zero")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local format = function()
    -- nil_ls can't format, use alejandra
    if client.name == 'nil_ls' then
      vim.cmd '%!alejandra -qq'
    else
      vim.lsp.buf.format({})
    end
  end

  lsp.default_keymaps({ buffer = bufnr })

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  --vim.keymap.set({ 'n', 'x' }, 'gq', format, opts)
  vim.keymap.set({ 'n', 'x' }, '<leader>f', format, opts)
end)



require('mason').setup({})
require('mason-lspconfig').setup({
  -- ensure_installed = {
  --   'clangd',
  --   'pylsp',
  --   'yamlls',
  --   'lua_ls',
  -- },
})

vim.lsp.enable('nil_ls')
vim.lsp.enable('glsl_analyzer')
vim.lsp.enable('bashls')
vim.lsp.enable('yamlls')
vim.lsp.enable('pylsp')
vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
  filetypes = { "h", "hpp", "c", "cpp", "cxx", "cppm", "mpp", "ixx" },
  cmd = { "clangd", "--header-insertion=never" }
})
-- vim.cmd [[ autocmd BufRead,BufNewFile *.mpp set filetype=mpp ]]
-- vim.cmd [[ autocmd BufRead,BufNewFile *.ixx set filetype=ixx ]]
-- vim.cmd [[ autocmd BufRead,BufNewFile *.cppm set filetype=cppm ]]
vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "4"
        }
      },
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})



lsp.setup({})

vim.diagnostic.config({
  virtual_text = true,
  --float = {
  --  border = 'single',
  --},
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  mapping = cmp_mappings,
})
