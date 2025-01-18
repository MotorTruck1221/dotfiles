local lsp = require('lsp-zero')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
      'ts_ls',
      'astro',
      'denols'
  },
  handlers = {
    function(server_name)
      if server_name == 'ts_ls' then
          local lspc = require('lspconfig')
          lspc[server_name].setup({
              on_attach = on_attach,
              root_dir = lspc.util.root_pattern("package-lock.json", "pnpm-lock.yaml", "yarn.lock"),
              single_file_support = false
          })
      elseif server_name == 'denols' then
          local lspc = require('lspconfig')
          lspc[server_name].setup({
              on_attach = on_attach,
              root_dir = lspc.util.root_pattern("deno.json", "deno.jsonc", "deno.lock")
          })
      else
        require('lspconfig')[server_name].setup({})
      end
    end,
  },
})

local lspconfig = require ('lspconfig')
lspconfig.zls.setup {}

--local cmp = require('cmp')
--local cpm_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--	['<C-y>'] = cmp.mapping.confirm({ select = true }),
--	['<C-Space'] = cmp.mapping.complete(),	
--})

-- Remove the default <Tab> mapping from nvim-cmp
-- For some reason, this doesn't work
--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

--lsp.setup_nvim_cmp({
--	mapping = cmp.mappings
--})

--lsp.set_preferences({
--   suggest_lsp_servers = false,
--    sign_icons = {
        --error = 'E',
        --warn = 'W',
       -- hint = 'H',
     --   info = 'I'
--   }
--})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

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
end)

-- (Optional) Configure lua language server for neovim
 -- lsp.nvim_workspace()

lsp.setup()
