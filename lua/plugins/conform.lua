return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    keys = {
        {
            "<leader>bf",
            function()
                require("conform").format({ async = true })
            end,
            mode = "n",
            desc = "Format buffer",
        }
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                html = { "djlint" },
            },
        })
    end,
}
