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
            lualine_x = {
				{
					"buffers",
					show_filename_only = true,
					hide_filename_extension = false,
					show_modified_status = true,
					mode = 2, 
					max_length = vim.o.columns * 2 / 3,
				},
			}, 
			lualine_z = {
				function()
					return vim.b.pinned and "Pinned" or "Not pinned"
				end,
			},
        },
    },
}

