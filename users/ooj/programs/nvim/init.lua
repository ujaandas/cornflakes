-- Disable Vi compatibility
vim.opt.compatible = false

-- Show matching
vim.opt.showmatch = true

-- Ignore case
vim.opt.ignorecase = true

-- Enable mouse
vim.opt.mouse = 'v'

-- Highlight search
vim.opt.hlsearch = true

-- Incremental search
vim.opt.incsearch = true

-- Set tab stops
vim.opt.tabstop = 4

-- Set soft tab stops
vim.opt.softtabstop = 4

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set autoindent width
vim.opt.shiftwidth = 4

-- Autoindent new lines
vim.opt.autoindent = true

-- Show line numbers
vim.opt.number = true

-- Bash-like tab completion
vim.opt.wildmode = {'longest', 'list'}

-- Set column border
vim.opt.colorcolumn = '80'

-- Enable file type plugins and indentation
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Enable mouse click
vim.opt.mouse = 'a'

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Enable file type plugins
vim.cmd('filetype plugin on')

-- Highlight cursor line
vim.opt.cursorline = true

-- Nicer scrolling
vim.opt.ttyfast = true
