local servers = {
    "clangd",
    "html",
    "jsonls",
    "tsserver",
    "lua_ls",
    "pyright",
    "tailwindcss",
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
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    on_attach = function()
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
                    end,
                    capabilities = capabilities,
                })
            end
        end
    }
}
