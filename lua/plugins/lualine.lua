return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = true,
    opts = {
        sections = {
            lualine_c = {
                {
					function()
						local ok, oil = pcall(require, "oil")
						if ok then
							local path = oil.get_current_dir()
							if path then
								return vim.fn.fnamemodify(path, ":~")
							end
						end
						return vim.fn.expand("%:~:h")
					end
                },
				{
					"filename",
					path = 0,
				},
            },
        },
    },
}

