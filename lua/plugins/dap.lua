return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        event = "VeryLazy",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "/home/weerawatw/.local/share/codelldb/extension/adapter/codelldb",
                    args = { "--port", "${port}" },
                },
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
            dap.configurations.c = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set("n", "<Leader>dc", dap.continue)
            vim.keymap.set("n", "<Leader>dbp", dap.toggle_breakpoint)
            vim.keymap.set("n", "<Leader>dx", dapui.close)
            vim.keymap.set("n", "<F7>", dap.step_over)
            vim.keymap.set("n", "<F8>", dap.step_into)
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        event = "VeryLazy",
        config = function()
            require("dap-python").setup("/home/weerawatw/bin/debugpy-venv/debugpy/bin/python")
        end,
    },
}
