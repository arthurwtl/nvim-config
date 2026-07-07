return {
    { "folke/tokyonight.nvim" },
    { "catppuccin/nvim", name = "catppuccin" },
    { "rebelot/kanagawa.nvim" },
    { "morhetz/gruvbox" },
    { "mocte4/godotcolour-vim" },
    { "zootedb0t/citruszest.nvim" },
    { "Shatur/neovim-ayu" },

    {
        "tomasiser/vim-code-dark",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("codedark")
        end,
    },
}
