return {
    "rebelot/kanagawa.nvim",
    opts = {
        theme = "wave",
        background = {
            dark = "wave",
        },
        overrides = function(colors)
            local theme = colors.theme
            local bg = "#1c1f26"
            return {
                Normal = { fg = theme.ui.fg, bg = bg },
                NormalFloat = { bg = bg },
                FloatBorder = { bg = bg, fg = theme.ui.fg },
                SignColumn = { bg = bg },
                FoldColumn = { bg = bg },
                LineNr = { bg = bg },
                CursorLineNr = { bg = bg },
            }
        end,
    },
}
