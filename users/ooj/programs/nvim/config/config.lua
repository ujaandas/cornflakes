-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse support
vim.o.mouse = 'a'

-- Set clipboard to use system clipboard
vim.o.clipboard = 'unnamedplus'

-- Set tab spacing
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set search options
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = false

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Enable cursorline
vim.wo.cursorline = true

-- Set up a split layout
vim.o.splitright = true
vim.o.splitbelow = true

-- Set colorscheme to material
-- vim.cmd("colorscheme material")