return {
    {
        "folke/snacks.nvim",
        opts = {
            notifier = {
                timeout = 5000,
            },
            image = {
                enabled = true,
            },
        },
        keys = {
            {
                "<leader>fn",
                function()
                    local file = vim.fn.expand("%:t")
                    vim.fn.setreg("+", file)
                    vim.notify("Copied file name: " .. file)
                end,
                desc = "Copy file name",
            },
            {
                "<leader>fp",
                function()
                    local file = vim.fn.expand("%:p")
                    vim.fn.setreg("+", file)
                    vim.notify("Copied full path: " .. file)
                end,
                desc = "Copy full path",
            },
        },
    },
}
