return {
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--header-insertion=never",
            },
        })
        lspconfig.tsserver.setup({ capabilities = capabilities })
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {
                            "vim",
                            "require",
                        },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            },
        })
        lspconfig.html.setup({
            capabilities = capabilities,
            filetypes = {
                "html", "javascriptreact", "typescriptreact"
            }
        })
        lspconfig.jsonls.setup({ capabilities = capabilities })
        lspconfig.pyright.setup({ capabilities = capabilities })
        lspconfig.tailwindcss.setup({ capabilities = capabilities })
        lspconfig.marksman.setup({ capabilities = capabilities })
        lspconfig.cssls.setup({ capabilities = capabilities })

        vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, {})
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set('n', '<Leader>sdf', vim.diagnostic.open_float, {})
    end
}
