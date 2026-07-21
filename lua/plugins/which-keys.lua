return {
    "folke/which-key.nvim",
    opts = {
		delay = 1500,

		spec =  {
			{ "<leader>l", group = "LSP" },
			{ "<leader>g", group = "Git" },
			{ "<leader>f", group = "Find" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>s", group = "Split" },
			{ "<leader>r", group = "Rust" },
		}
	},
}

