vim.opt.autoread = true
vim.opt.cmdheight = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 3
vim.opt.signcolumn = "yes:2"
vim.opt.smartindent = true
vim.opt.softtabstop = 0
vim.opt.syntax = "on"
vim.opt.tabstop = 3
vim.opt.undofile = true
vim.opt.wildmenu = true
vim.opt.wildmode = "noselect:lastused,full"
vim.opt.wildoptions = { "pum", "fuzzy" }
vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"

-- Fix backspace indent
vim.opt.backspace = "indent,eol,start"

-- Enable hidden and unsaved buffers
vim.opt.hidden = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Session management
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal"

-- Keep swap files with Neovim state instead of the configuration.
local swap_dir = vim.fn.stdpath("state") .. "/swap"
vim.fn.mkdir(swap_dir, "p")
vim.opt.directory = swap_dir .. "//"

-- Title bar settings
vim.opt.title = true
vim.opt.titlestring = "%F"

-- Don't redraw while executing macros
vim.opt.lazyredraw = true
vim.opt.conceallevel = 1

-- Remove fill characters (the little tildes)
vim.opt.fillchars = { eob = " " }

-- terminal scrollback
vim.g.terminal_scrollback_buffer_size = 10000
