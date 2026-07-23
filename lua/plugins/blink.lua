return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },

	opts = {
		enabled = function()
			return vim.bo.filetype ~= "text"
		end,

		keymap = {
		  preset = "none",
			  ["<CR>"] = {
				"select_next",
				"snippet_forward",
				"fallback",
			  },

			  ["<S-CR>"] = {
				"select_prev",
				"snippet_backward",
				"fallback",
			  },

			  ["<Tab>"] = {
				"accept",
				"fallback",
			},
		},
	},
}
