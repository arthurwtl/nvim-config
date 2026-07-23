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

        vim.keymap.set("n", "<leader>fb", builtin.buffers, {
			desc = "Buffers"
		})

        vim.keymap.set("n", "<leader>fh", builtin.current_buffer_fuzzy_find, {
			desc = "current fuzzy"
		})

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({
				cwd = project_root(),
			})
		end, {desc = "Files"})

		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({
				cwd = project_root(),
			})
		end, {desc = "Live grep"})

		-- LSP pikers
		-- vim.keymap.set("n", "<leader>fw", function()
		-- 	builtin.lsp_dynamic_workspace_symbols({
		-- 		cwd = project_root(),
		-- 	})
		-- end, {desc = "LSP symboles in workspace"})

		vim.keymap.set("n", "<leader>fs", function()
			builtin.lsp_document_symbols({
				cwd = project_root(),
			})
		end, {desc = "LSP symboles"})

		vim.keymap.set("n", "<leader>fr", function()
			builtin.lsp_references({
				cwd = project_root(),
			})
		end, {desc = "References"})
    end,
}
