-- Line numbers and numbers relative to position
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab style
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search style
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- When scrolling have 8 lines below always
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Set new horizontal splits below and vertical splits on the right
vim.cmd("set splitbelow splitright")

--vim.opt.colorcolumn = "80"
