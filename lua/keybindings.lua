--
-- Windows
--
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left one window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down one window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up one window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right one window" })
vim.keymap.set("n", "<leader>q", "<C-w>c", { desc = "Close window" })
vim.keymap.set("n", "|", "<C-w>v", { desc = "Split vertical" })
vim.keymap.set("n", '\\', "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>bC", ":%bd!<cr>", { desc = "Close all buffers" })

--
-- Vmap for maintain Visual Mode after shifting > and <
--
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--
-- Move lines up and down in visual mode
--
vim.keymap.set("v", "J", ":m'>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m-2<CR>gv=gv")

--
-- Joining
--
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

--
-- Line number toggling
--
vim.keymap.set("n", "<C-n><C-n>", ":set relativenumber!<CR>", { desc = "Toggle relative line numbers" })

--
-- Lsp keybindings
--
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "LSP actions" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol" })
-- vim.keymap.set("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>dj", "<cmd>lua vim.diagnostic.jump({ count = 1 })<cr>", { desc = "Go to next diagnostic" })
-- vim.keymap.set("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",
vim.keymap.set("n", "<leader>dk", "<cmd>lua vim.diagnostic.jump({ count = -1 })<cr>",
   { desc = "Go to previous diagnostic" })

--
-- vim.pack keybindings
--
vim.keymap.set("n", "<leader>pu", "<cmd>lua vim.pack.update()<cr>", { desc = "Update pack" })
