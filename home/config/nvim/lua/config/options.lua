-- disable animations
vim.g.snacks_animate = false

-- disable recording
vim.opt.shortmess:append("q")

-- add breadcrumbs recording blank lines
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
