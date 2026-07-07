local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})

-- require("lazy").setup({
--   {
--
-- 	-- Packages
--     "nvim-treesitter/nvim-treesitter",
--     branch = "master",
--     lazy = false,
--     build = ":TSUpdate",
--     config = function()
--       require("nvim-treesitter.configs").setup({
--         ensure_installed = {
--           "lua", "vim", "vimdoc",
--           "python", "javascript", "typescript",
--           "bash", "json", "markdown",
--         },
--         auto_install = true,
--         sync_install = false,
--         highlight = {
--           enable = true,
--         },
--         indent = {
--           enable = true,
--         },
--       })
--     end,
--   },

	 -- {
	 --       "nvim-lualine/lualine.nvim",
	 --       dependencies = {
	 --           "nvim-tree/nvim-web-devicons",
	 --       },
	 --       config = true,
	 --   },

	-- {
	--        "saghen/blink.cmp",
	--        version = "1.*",
	--        dependencies = {
	--            "rafamadriz/friendly-snippets",
	--        },
	--        opts = {},
	--    },

	  -- {
	  --      "stevearc/oil.nvim",
	  --      config = function()
	  --          require("oil").setup()
	  --      end,
	  --  },

	-- {
	--        "nvim-telescope/telescope.nvim",
	--        dependencies = {
	--            "nvim-lua/plenary.nvim",
	--        },
	--    },
	--
	--     {
	--        "tpope/vim-fugitive",
	--    },
	--
	-- {
	--        "lewis6991/gitsigns.nvim",
	--        config = true,
	--    },
	--
	--  {
	-- "mason-org/mason-lspconfig.nvim",
	-- opts = {
	--   ensure_installed = {
	-- 	"rust_analyzer",
		-- "clangd",
		-- "pyright",
	--   },
	-- },
	-- dependencies = {
	--   {
	-- 	"mason-org/mason.nvim",
	-- 	opts = {},
	--   },
	--   "neovim/nvim-lspconfig",
	-- },
	--   },
	--
	--
	--
	-- -- Thèmes
	--    {
	--        "folke/tokyonight.nvim",
	--    },
	--
	--    {
	--        "catppuccin/nvim",
	--        name = "catppuccin",
	--    },
	--
	--    {
	--        "rebelot/kanagawa.nvim",
	--    },
	--
	--    {
	--        "morhetz/gruvbox",
	--    },
	--
	-- {
	-- 	"mocte4/godotcolour-vim",
	-- },
	--
	-- {
	-- 	"zootedb0t/citruszest.nvim",
	-- },
	--
	-- {
	-- 	"Shatur/neovim-ayu",
	-- },

-- 	{
--     "tomasiser/vim-code-dark",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme("codedark")
--     end,
--   },
-- })
