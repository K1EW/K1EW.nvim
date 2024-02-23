local servers = {
    "clangd",
    "html",
    "jsonls",
    "tsserver",
    "lua_ls",
    "pyright",
    "tailwindcss",
    "marksman",
    "omnisharp",
}

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<Leader>dt', vim.diagnostic.open_float, {})

            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities})
            lspconfig.jsonls.setup({ capabilities = capabilities})
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                detached = false,
                single_file_support = true
            })
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.pyright.setup({ capabilities = capabilities })
            lspconfig.tailwindcss.setup({ capabilities = capabilities })
        end
    }
}
