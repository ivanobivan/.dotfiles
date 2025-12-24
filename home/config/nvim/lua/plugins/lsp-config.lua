return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            ensure_installed = {
                "prettier",
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
            servers = {
                vtsls = {},
                angularls = {},
                eslint = {},
                prettier = {},
            },
            setup = {
                clangd = function(_, opts)
                    opts.capabilities.offsetEncoding = { "utf-16" }
                end,
            },
        },
    },
}
