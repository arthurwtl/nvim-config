return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },

	opts = {
		keymap = {
		  preset = "none",
			  ["<Tab>"] = {
				"select_next",
				"snippet_forward",
				"fallback",
			  },

			  ["<S-Tab>"] = {
				"select_prev",
				"snippet_backward",
				"fallback",
			  },

			  ["<CR>"] = {
				"accept",
				"fallback",
			},
		},
	},
}
