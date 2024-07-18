return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local api = require("nvim-tree.api")
        local options = { noremap = true, silent =  true }
        require("nvim-tree").setup({
            vim.keymap.set("n", "<Leader>e", api.tree.toggle, options)
        })
    end
}
