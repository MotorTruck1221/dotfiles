vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP',
    callback = function(event)
        local opts = { buffer = event.buf }
        local kmap = vim.keymap.set
        kmap("n", "gd", function() vim.lsp.buf.definition() end, opts)
        kmap("n", "K", function() vim.lsp.buf.hover() end, opts)
        kmap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        kmap("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        kmap("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        kmap("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        kmap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        kmap("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        kmap("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        kmap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local lspcd = require('lspconfig').util.default_config
        local cmp = require('cmp')
        lspcd.capabilities = vim.tbl_deep_extend(
            'force',
            lspcd.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )
        cmp.setup({
            sources = {
                { name = 'nvim_lsp' }
            },
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({}),
        })
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                'ts_ls',
                'astro',
                'denols',
                'clangd'
            },
            handlers = {
                function(server_name)
                    local lsp = require('lspconfig')
                    if server_name == 'ts_ls' then
                        lsp[server_name].setup({
                            on_attach = on_attach,
                            root_dir = lsp.util.root_pattern("package-lock.json", "pnpm-lock.yaml", "yarn.lock"),
                            single_file_support = false
                        })
                    elseif server_name == 'denols' then
                      lsp[server_name].setup({
                          on_attach = on_attach,
                          root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc", "deno.lock")
                      })
                    else
                        lsp[server_name].setup({})
                    end
                end
            }
        })
    end
}
