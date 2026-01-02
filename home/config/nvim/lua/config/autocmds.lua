vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "javascript", "html", "css", "less", "scss", "tsx", "jsx", "react", "saas", "sh" },
    callback = function()
        vim.bo.shiftwidth = 4
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.expandtab = true
    end,
})
