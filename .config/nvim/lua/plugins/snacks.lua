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
            explorer = {
                replace_netrw = true,
                trash = true,
            },
            picker = {
                ignored = true,
                hidden = true,
                sources = {
                    explorer = {},
                },
            },
            notifier = {
                timeout = 5000,
            },
        },
    },
}
