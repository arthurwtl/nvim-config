local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<Tab>", "<cmd>bnext<CR>")
map("n", "<S-l>", "<cmd>bnext<CR>")
map("n", "<S-h>", "<cmd>bprevious<CR>")
