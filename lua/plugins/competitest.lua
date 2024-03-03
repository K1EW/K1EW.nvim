return {
    "xeluxee/competitest.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("competitest").setup({
            testcases_directory = "./testcases",
            testcases_use_single_file = true,
        })
    end,
}
