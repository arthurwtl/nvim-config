-- Esc is CapLock

vim.g.mapleader = " "
local map = vim.keymap.set


-- Buffer navigation
map("n", "-", "<CMD>Oil<CR>", {
	desc = "Oil",
})
map("n", "<S-l>", "<cmd>bnext<CR>", {
	desc = "Next buffer"
})
map("n", "<S-h>", "<cmd>bprevious<CR>", {
	desc = "Previous buffer"
})
map("n", "<leader>bd", "<cmd>bdelete<CR>", {
	desc = "Delete current buffer"
})
-- Pin/unpin (voir autocmds)
vim.keymap.set("n", "<leader>bp", function()
  local buf = vim.api.nvim_get_current_buf()
  vim.b[buf].pinned = not vim.b[buf].pinned
  vim.cmd("redrawstatus")
  vim.notify(vim.b[buf].pinned and "Buffer épinglé" or "Buffer désépinglé")
end, { desc = "Toggle buffer pin" })

-- Terminal and right split manipulation/navigation
map("t", "<Esc>", [[<C-\><C-n>]])
map("n", "<leader>sh", "<C-w>h", {
	desc = "Left split"
})
map("n", "<leader>sj", "<C-w>j", {
	desc = "Down split",
})
map("n", "<leader>sk", "<C-w>k", {
	desc = "Upper split"
})
map("n", "<leader>sl", "<C-w>l", {
	desc = "Left split"
})
map("n", "<leader>sp", "<C-w>p", {
	desc = "Previous split"
})

map("n", "<leader>st", function()
    vim.cmd("rightbelow vsplit")
    vim.cmd("vertical resize " .. math.floor(vim.o.columns * 2 / 5))
	vim.cmd("terminal")
	_G.term_win = vim.api.nvim_get_current_win()
	_G.term_buf = vim.api.nvim_get_current_buf()
	vim.cmd("startinsert")
end, {
    desc = "Open a new terminal in a split",
})

vim.keymap.set("n", "<leader>sr", function()
    vim.cmd("w")
	local current_win = vim.api.nvim_get_current_win()
    if _G.term_win and vim.api.nvim_win_is_valid(_G.term_win) then
        vim.api.nvim_set_current_win(_G.term_win)
		vim.api.nvim_set_current_buf(_G.term_buf)
        local job = vim.b.terminal_job_id
        vim.cmd("startinsert")
        vim.fn.chansend(job, "\x1b[A\n")
		vim.api.nvim_set_current_win(current_win)
		vim.cmd("stopinsert")
    end
end, { desc = "Run last command again" })

map("n", "<leader>sn", function()
    vim.cmd("rightbelow vsplit")
    vim.cmd("vertical resize " .. math.floor(vim.o.columns * 2 / 5))
    vim.cmd("Oil")
end, {
    desc = "Open a new split and open oil",
})

map("n", "<leader>sd", "<cmd>close<CR>", {
	desc = "Close split"
})
map("n", "<leader>s>", "<C-w>>", {
	desc = "Move split right"
})
map("n", "<leader>s<", "<C-w><", {
	desc = "Move split left"
})


-- Telescope mappings are in the plugin part


-- generics LSP mappings
map("n", "<leader>ld", vim.lsp.buf.definition, { 
	desc = "Go to definition" 
})

vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, {
	desc = "Show documentation" 
})

vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { 
	desc = "Rename symbol" 
})

vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { 
	desc = "Code action" 
})

vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, {
    desc = "Show diagnostic",
})

-- Rust LSP mappings
vim.keymap.set("n", "<leader>rr", "<cmd>RustLsp runnables<CR>", {
    desc = "Show Rust runnables",
})


-- Git mappings

vim.keymap.set("n", "<leader>gg", "<cmd>Git<CR>", {
    desc = "Open git fugitive menu",
})

