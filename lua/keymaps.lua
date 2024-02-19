function MyTrim()
  local save = vim.fn.winsaveview()
  vim.cmd("keeppatterns %s/\\s\\+$\\|\\r$//e")
  vim.fn.winrestview(save)
end

vim.g.mapleader = " "
local options = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remove ^M when pasted from Window's clipboard
vim.keymap.set("n", ",m", MyTrim, options)

-- Quickly quit insert mode
keymap("i", "jk", "<ESC>", options)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", options)
keymap("n", "<S-h>", ":bprevious<CR>", options)

-- Move text up and down
keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", options)
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", options)
