return {
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    config = function()
        local lspconfig = require("lspconfig")

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local util = require("lspconfig.util")

        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--header-insertion=never",
            },
        })
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
        })
        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
        })
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {
                            "vim",
                            "require",
                        },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
        lspconfig.pylsp.setup({
            capabilities = capabilities,
            settings = {
                pylsp = {
                    plugins = {
                        -- pyflakes: Static analysis tool
                        pyflakes = {
                            enabled = false,
                        },
                        -- mccabe: Complexity checker
                        mccabe = {
                            enabled = false,
                        },
                        -- pycodestyle: Code style checker
                        pycodestyle = {
                            enabled = false,
                        },
                    },
                },
            },
        })
        require("lspconfig").ruff.setup({
            capabilities = capabilities,
            init_options = {
                settings = {
                    args = {},
                },
            },
            root_dir = function(fname)
                local root_files = {
                    "pyproject.toml",
                    "setup.py",
                    "setup.cfg",
                    "requirements.txt",
                    "Pipfile",
                }
                return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
            end,
        })

        local options = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, options)
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, options)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, options)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
        vim.keymap.set("n", "<leader>qf", vim.lsp.buf.code_action, options)
        vim.keymap.set("n", "<leader>sdf", vim.diagnostic.open_float, options)
        vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, options)
    end,
}
