vim.g.mapleader = " "
local options = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Quickly quit insert mode
keymap("i", "jk", "<ESC>", options)

-- Buffer navigation
keymap("n", "<S-h>", ":bp<CR>", options)
keymap("n", "<S-l>", ":bn<CR>", options)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

-- Move text up and down
keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", options)
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", options)

-- Keep centered when go half page up/down
keymap("n", "<C-d>", "<C-d>zz", options)
keymap("n", "<C-u>", "<C-u>zz", options)

-- Reserve register after pasted
keymap("v", "p", "\"_dP", options)

-- Reserve register after delete
keymap("n", "d", "\"_d", options)
keymap("v", "d", "\"_d", options)

-- Reserve register after change
keymap("n", "ci", "\"_ci", options)
keymap("n", "ca", "\"_ca", options)
keymap("v", "c", "\"_c", options)

-- Delete and save to register (cut)
keymap("n", "<Leader>d", "d", options)
keymap("v", "<Leader>d", "d", options)

-- Indentation
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)

-- Remove ^M when pasted from Window's clipboard
vim.keymap.set("n", "<Leader>^M", function()
    vim.cmd("keeppatterns %s/\\s\\+$\\|\\r$//e")
    vim.fn.winrestview(vim.fn.winsaveview())
end, options)
