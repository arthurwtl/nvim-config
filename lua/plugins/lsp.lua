return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "rust_analyzer",
            "clangd",
            "pyright",
			"ltex_plus",
        },
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {},
        },
        "neovim/nvim-lspconfig",
    },
}
