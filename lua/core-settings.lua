--
-- Basic Neovim Settings
--

-- Leader
vim.g.mapleader = " "

-- Max memory for pattern matching
vim.opt.maxmempattern = 1000000

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"

-- Fix backspace indent
vim.opt.backspace = "indent,eol,start"

-- Tabs and indenting
vim.opt.tabstop = 3
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Enable hidden and unsaved buffers
vim.opt.hidden = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Session management
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal"

-- Global clipboard
-- vim.opt.clipboard = "unnamed,unnamedplus"

-- Show the sign column
vim.opt.signcolumn = "yes"

-- Set swp files location
vim.opt.directory = vim.fn.expand("$HOME/.config/nvim/swap")

--
-- Visual Settings
--

vim.opt.syntax = "on"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.wrap = false

-- Status Bar
vim.opt.laststatus = 2
vim.opt.modeline = true
vim.opt.modelines = 10
vim.opt.statusline = "%F%m%r%h%w%=(%{&ff}/%Y) (line %l/%L, col %c)"

-- Title bar settings
vim.opt.title = true
vim.opt.titlestring = "%F"

-- Highlight current line
vim.opt.cursorline = true

-- Start with relative line numbers
vim.opt.relativenumber = true

-- Don't redraw while executing macros
vim.opt.lazyredraw = true
vim.opt.conceallevel = 1

-- Remove fill characters (the little tildes)
vim.opt.fillchars = { eob = " " }

-- terminal scrollback
vim.g.terminal_scrollback_buffer_size = 10000
