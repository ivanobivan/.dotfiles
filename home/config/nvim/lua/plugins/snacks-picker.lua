return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                ignored = false,
                hidden = false,
                sources = {
                    explorer = {
                        hidden = true,
                        ignored = true,
                        win = {
                            list = {
                                keys = {
                                    ["<Right>"] = "confirm",
                                    ["<Left>"] = "explorer_close",
                                },
                            },
                        },
                    },
                },
            },
        },
    },
}
