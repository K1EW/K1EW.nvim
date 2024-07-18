return {
    "xeluxee/competitest.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("competitest").setup({
            testcases_directory = "./testcases",
            testcases_use_single_file = true,
            compile_command = {
                cpp = { exec = "g++", args = {"-g", "$(FNAME)", "-o", "out"} },
                c = { exec = "g", args = {"-g", "$(FNAME)", "-o", "out"} },
            },
            run_command = {
                cpp = { exec = "./out" },
                c = { exec = "./out" },
            }
        })
    end,
}
