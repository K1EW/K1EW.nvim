return {
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "html",
                    "jsonls",
                    "tsserver",
                    "lua_ls",
                    "pyright",
                    "tailwindcss",
                    "marksman",
                }
            })
        end
    },
}
