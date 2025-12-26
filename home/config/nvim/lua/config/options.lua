-- disable animations
vim.g.snacks_animate = false

-- disable recording
vim.opt.shortmess:append("q")

-- add breadcrumbs recording blank lines
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

-- add shift/ctrl selectin behavior in n x mode
vim.opt.keymodel:append({ "startsel", "stopsel" })
