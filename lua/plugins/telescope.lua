return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous
                    }
                }
            }
        })

        local builtin = require("telescope.builtin")
        local options = { noremap = true, silent = true }
        vim.keymap.set("n", "<Leader>ff", builtin.find_files, options)
        vim.keymap.set("n", "<Leader>fg", builtin.live_grep, options)
        vim.keymap.set("n", "<Leader>fb", builtin.buffers, options)
    end
}
