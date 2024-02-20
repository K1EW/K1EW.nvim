return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            source = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,

                null_ls.builtins.diagnostics.eslint_d,
            }
        })

        vim.keymap.set("n", "<Leader>bf", vim.lsp.buf.format, { noremap = true, silent = true })
    end
}
