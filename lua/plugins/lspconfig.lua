return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set('n', '<Leader>dt', vim.diagnostic.open_float, {})

        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--header-insertion=never",
            }
        })
        lspconfig.html.setup({ capabilities = capabilities })
        lspconfig.jsonls.setup({ capabilities = capabilities })
        lspconfig.tsserver.setup({
            capabilities = capabilities,
            detached = false,
            single_file_support = true
        })
        lspconfig.lua_ls.setup({ capabilities = capabilities })
        lspconfig.pyright.setup({ capabilities = capabilities })
        lspconfig.tailwindcss.setup({ capabilities = capabilities })
        lspconfig.marksman.setup({ capabilities = capabilities })
    end
}
