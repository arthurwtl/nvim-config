-- Esc is CapLock

vim.g.mapleader = " "
local map = vim.keymap.set

	

-- Buffer navigation
map("n", "-", "<CMD>Oil<CR>")
map("n", "<S-l>", "<cmd>bnext<CR>")
map("n", "<S-h>", "<cmd>bprevious<CR>")

-- Terminal and right split manipulation/navigation
map("t", "<Esc>", [[<C-\><C-n>]])
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>p", "<C-w>p")

map("n", "<leader>st", function()
    vim.cmd("rightbelow vsplit")
    vim.cmd("vertical resize " .. math.floor(vim.o.columns * 2 / 5))
	vim.cmd("terminal")
	_G.term_win = vim.api.nvim_get_current_win()
	_G.term_buf = vim.api.nvim_get_current_buf()
	vim.cmd("startinsert")
end, {
    desc = "Open a new terminal and enter it, memorize the terminal id",
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
end, { desc = "Rerun last command" })

map("n", "<leader>sn", function()
    vim.cmd("rightbelow vsplit")
    vim.cmd("vertical resize " .. math.floor(vim.o.columns * 2 / 5))
    vim.cmd("Oil")
end, {
    desc = "Open a new split and open oil",
})

map("n", "<leader>sd", "<cmd>close<CR>")
map("n", "<leader>s>", "<C-w>>")
map("n", "<leader>s<", "<C-w><")

-- Pin/unpin (voir autocmds)

vim.keymap.set("n", "<leader>bp", function()
  local buf = vim.api.nvim_get_current_buf()
  vim.b[buf].pinned = not vim.b[buf].pinned
  vim.cmd("redrawstatus")
  vim.notify(vim.b[buf].pinned and "Buffer épinglé" or "Buffer désépinglé")
end, { desc = "Toggle buffer pin" })



