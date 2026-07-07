return {
    "stevearc/oil.nvim",
    opts = {
		delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
	},
    keys = {
        {
            "<leader>.",
            function()
                require("oil").toggle_hidden()
            end,
            desc = "Toggle hidden files",
        },
    },
}
