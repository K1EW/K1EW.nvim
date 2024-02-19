return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        vim.g.barbar_auto_setup = false

        require("barbar").setup({
            animation = false
        })

        local options = { noremap = true, silent = true }
        local keymap = vim.api.nvim_set_keymap

        keymap("n", "<S-C>B", ":BufferClose<CR>", options)
    end
}
