return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "pretiterd", "prettier" } },
				javascriptreact = { { "pretiterd", "prettier" } },
				typescript = { { "pretiterd", "prettier" } },
				typescriptreact = { { "pretiterd", "prettier" } },
				html = { { "pretiterd", "prettier" } },
				css = { { "pretiterd", "prettier" } },
				json = { { "pretiterd", "prettier" } },
			},
		})

		vim.keymap.set({ "n", "v" }, "<Leader>bf", function()
			conform.format({
				timeout_ms = 500,
				lsp_fallback = true,
			})
		end, {})
	end,
}
