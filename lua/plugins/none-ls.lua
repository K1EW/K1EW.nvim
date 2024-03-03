return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            source = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
            }
        })

        vim.keymap.set("n", "<Leader>bf", vim.lsp.buf.format, { noremap = true, silent = true })
    end
}
