return {
    {
        "folke/snacks.nvim",
        opts = {
            dashboard = {
                preset = {
                    pick = function(cmd, opts)
                        return LazyVim.pick(cmd, opts)()
                    end,
                    header = [[
 ██████╗ ██████╗ ██╗██╗   ██╗ █████╗ ███╗   ██╗
██╔═══██╗██╔══██╗██║██║   ██║██╔══██╗████╗  ██║
██║   ██║██████╔╝██║██║   ██║███████║██╔██╗ ██║
██║   ██║██╔══██╗██║╚██╗ ██╔╝██╔══██║██║╚██╗██║
╚██████╔╝██████╔╝██║ ╚████╔╝ ██║  ██║██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝
]],
                },
            },
            picker = {
                ignored = false,
                hidden = false,
                sources = {
                    explorer = {
                        hidden = true,
                        ignored = true,
                    },
                },
            },
            notifier = {
                timeout = 5000,
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
