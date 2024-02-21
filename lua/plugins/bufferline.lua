return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("bufferline").setup({
            options = {
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " "
                        or (e == "warning" and " " or " ")
                        s = s .. n .. sym
                    end
                    return s
                end
            }
        })

        local options = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<S-H>", ":BufferLineCyclePrev<CR>", options)
        vim.api.nvim_set_keymap("n", "<S-L>", ":BufferLineCycleNext<CR>", options)
        vim.api.nvim_set_keymap("n", "<S-C>B", ":bd<CR>", options)
    end
}
