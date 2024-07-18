return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
			},
		})

		local options = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, options)
	end,
}
