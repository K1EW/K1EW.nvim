return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup()

        local options = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<Leader>e", ":Neotree toggle<CR>", options)
    end
}
