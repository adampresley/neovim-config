vim.g.netrw_liststyle = 3 -- tree view
vim.g.netrw_banner = 0    -- hide the banner
-- vim.g.netrw_browse_split = 4 -- open files in the previous window
vim.g.netrw_altfile = 1   -- keep the alternate file
vim.g.netrw_winsize = 25  -- left split size

vim.keymap.set("n", "<leader>e", ":Explore<cr>", { silent = true })
