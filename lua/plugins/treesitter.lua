return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    opts = {
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "python",
            "javascript",
            "typescript",
            "bash",
            "json",
            "markdown",
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
