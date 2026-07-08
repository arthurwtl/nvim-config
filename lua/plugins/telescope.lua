return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local builtin = require("telescope.builtin")
		local function project_root()
			return vim.fs.root(0, {
				".git",
				"Cargo.toml",
				"pyproject.toml",
				"uv.lock",
				"package.json",
				"go.mod",
			}) or vim.loop.cwd()
		end

        vim.keymap.set("n", "<leader>fb", builtin.buffers)
        vim.keymap.set("n", "<leader>fh", builtin.current_buffer_fuzzy_find)
		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({
				cwd = project_root(),
			})
		end)

		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({
				cwd = project_root(),
			})
		end)
    end,
}
